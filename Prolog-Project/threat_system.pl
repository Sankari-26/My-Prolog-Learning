% ============================================================================
% KNOWLEDGE BASE: DYNAMIC DECLARATIONS
% Allows facts to be asserted or retracted dynamically at runtime from Python
% Signature: event(ID, User, IP, FailedAttempts, Hour, DataMB, Dest, Protocol)
% ============================================================================
:- dynamic event/8.

% ============================================================================
% INFERENCE ENGINE: THREAT CLASSIFICATION RULES
% Evaluates security events against logical rules to deduce threats, risk,
% evidence traces, and actionable remediation recommendations.
% ============================================================================

% Rule 1: Critical Intrusion
% Triggered when brute-force threshold is breached specifically during abnormal night hours
classify(Id, 'Critical Intrusion', 'CRITICAL',
         'Repeated failed logins detected during abnormal night hours (00:00 - 05:00)',
         'Immediately quarantine host, reset credentials, and escalate to SOC tier-2') :-
    event(Id, _, _, Fails, Hour, _, _, _),
    Fails >= 3,
    Hour >= 0, Hour =< 5.

% Rule 2: Brute Force Attempt
% Triggered when failed login attempts exceed threshold during standard business hours
classify(Id, 'Brute Force Attempt', 'HIGH',
         'Authentication failure threshold exceeded (> 3 failed attempts)',
         'Apply firewall block to source IP and enforce multi-factor authentication') :-
    event(Id, _, _, Fails, Hour, _, _, _),
    Fails >= 3,
    (Hour < 0 ; Hour > 5).

% Rule 3: Data Exfiltration
% Triggered when high-volume data egresses to an external destination
classify(Id, 'Data Exfiltration', 'HIGH',
         'Outbound data transfer to external destination exceeded 2000 MB threshold',
         'Throttle egress bandwidth, terminate session, and inspect external endpoint') :-
    event(Id, _, _, _, _, MB, external, _),
    MB > 2000.

% Rule 4: Suspicious Insider Access
% Triggered when an account accesses resources during off-hours without brute-force flags
classify(Id, 'Suspicious Insider', 'MEDIUM',
         'Account authentication recorded outside standard business schedule (00:00 - 05:00)',
         'Audit user access privileges and verify shift authorization with management') :-
    event(Id, _, _, Fails, Hour, MB, _, _),
    Hour >= 0, Hour =< 5,
    Fails < 3,
    MB =< 2000.

% Rule 5: Normal Activity / Baseline
% Default fallback for events conforming to regular operational thresholds
classify(Id, 'Normal Activity', 'LOW',
         'All network metrics and authentication attempts conform to safe operational baselines',
         'Log event telemetry to standard audit index; no active mitigation required') :-
    event(Id, _, _, Fails, Hour, MB, Dest, _),
    Fails < 3,
    (Hour < 0 ; Hour > 5),
    (Dest == internal ; MB =< 2000).

% ============================================================================
% STANDALONE TEST RUNNER (Optional CLI Execution)
% Run with: ?- analyze.
% ============================================================================
analyze :-
    format('~n====================================================================~n'),
    format('          CYBERSECURITY EXPERT SYSTEM INFERENCE REPORT              ~n'),
    format('====================================================================~n~n'),
    forall(
        (classify(Id, Threat, Risk, Evidence, Action), event(Id, User, IP, _, _, _, _, _)),
        (
            format('Event ID:      #~w~n', [Id]),
            format('Target User:   ~w (IP: ~w)~n', [User, IP]),
            format('Inferred Threat: ~w~n', [Threat]),
            format('Risk Level:    ~w~n', [Risk]),
            format('Evidence:      ~w~n', [Evidence]),
            format('Action:        ~w~n', [Action]),
            format('--------------------------------------------------------------------~n')
        )
    ).