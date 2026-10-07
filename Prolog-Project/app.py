import pandas as pd
from flask import Flask, render_template
from pyswip import Prolog

app = Flask(__name__)

def run_expert_system():
    prolog = Prolog()
    prolog.consult("threat_system.pl")

    # 1. Read directly from the Excel spreadsheet
    df = pd.read_excel("cybersecurity_events.xlsx")

    # 2. Inject each Excel record into Prolog as dynamic facts
    for _, row in df.iterrows():
        prolog.assertz(
            f"event({row['EventID']}, '{row['User']}', '{row['SourceIP']}', "
            f"{row['FailedLogins']}, {row['LoginHour']}, {row['TransferMB']}, "
            f"{row['Destination']}, '{row['Protocol']}')"
        )

    # 3. Query the expert system rules
    query_str = (
        "classify(Id, Threat, Risk, Evidence, Action), "
        "event(Id, User, IP, Fails, Hour, MB, Dest, Proto)"
    )

    classified_data = []
    seen_ids = set()

    for sol in prolog.query(query_str):
        eid = int(sol["Id"])
        if eid not in seen_ids:
            seen_ids.add(eid)
            classified_data.append({
                "id": eid,
                "user": str(sol["User"]),
                "ip": str(sol["IP"]),
                "fails": int(sol["Fails"]),
                "hour": f"{int(sol['Hour']):02d}:00",
                "transfer": f"{int(sol['MB'])} MB",
                "dest": str(sol["Dest"]),
                "proto": str(sol["Proto"]),
                "threat": str(sol["Threat"]),
                "risk": str(sol["Risk"]),
                "evidence": str(sol["Evidence"]),
                "action": str(sol["Action"])
            })

    classified_data.sort(key=lambda x: x["id"])
    return classified_data

@app.route("/")
def index():
    dataset = run_expert_system()

    metrics = {
        "total": len(dataset),
        "critical": sum(1 for d in dataset if d["risk"] == "CRITICAL"),
        "high": sum(1 for d in dataset if d["risk"] == "HIGH"),
        "medium": sum(1 for d in dataset if d["risk"] == "MEDIUM"),
        "low": sum(1 for d in dataset if d["risk"] == "LOW")
    }

    return render_template("index.html", data=dataset, metrics=metrics)

if __name__ == "__main__":
    app.run(debug=True, port=5000)