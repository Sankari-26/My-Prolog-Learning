import pandas as pd

records = [
    [101, "user_admin", "192.168.1.10", 0, 10, 15, "internal", "SSH"],
    [102, "alice_dev", "192.168.1.11", 1, 14, 45, "internal", "HTTPS"],
    [103, "ext_attacker", "203.0.113.5", 6, 11, 5, "external", "RDP"],
    [104, "charlie_hr", "10.0.0.14", 0, 3, 120, "internal", "HTTPS"],
    [105, "david_ops", "198.51.100.22", 8, 2, 450, "external", "SSH"],
    [106, "eva_finance", "192.168.1.15", 0, 13, 7200, "external", "SFTP"],
    [107, "frank_sales", "192.168.1.18", 0, 9, 30, "internal", "HTTPS"],
    [108, "grace_qa", "10.0.0.25", 4, 15, 12, "internal", "SSH"],
    [109, "hacker_bot", "198.51.100.4", 1, 4, 8900, "external", "FTP"],
    [110, "ian_legal", "192.168.1.20", 0, 16, 10, "internal", "HTTPS"],
    [111, "unknown_ip", "203.0.113.19", 5, 23, 2, "external", "RDP"],
    [112, "jack_dev", "192.168.1.22", 0, 12, 18, "internal", "HTTPS"],
    [113, "karen_mgr", "10.0.0.50", 0, 1, 50, "internal", "HTTPS"],
    [114, "leo_contractor", "198.51.100.80", 9, 1, 1500, "external", "SSH"],
    [115, "mary_it", "192.168.1.30", 2, 10, 5, "internal", "HTTPS"],
    [116, "nick_ops", "10.0.0.60", 0, 14, 5500, "external", "SFTP"],
    [117, "shadow_user", "203.0.113.44", 4, 16, 20, "external", "RDP"],
    [118, "oliver_sales", "192.168.1.35", 0, 11, 40, "internal", "HTTPS"],
    [119, "pat_hr", "10.0.0.75", 0, 5, 15, "internal", "HTTPS"],
    [120, "rogue_agent", "198.51.100.91", 12, 3, 250, "external", "SSH"],
    [121, "quinn_qa", "192.168.1.40", 1, 9, 80, "internal", "HTTPS"],
    [122, "ryan_backup", "10.0.0.88", 0, 15, 6200, "external", "SFTP"],
    [123, "steve_remote", "203.0.113.7", 7, 13, 10, "external", "RDP"],
    [124, "tina_legal", "192.168.1.42", 0, 2, 8, "internal", "HTTPS"],
    [125, "uma_it", "198.51.100.12", 0, 10, 300, "internal", "HTTPS"],
    [126, "victor_dev", "192.168.1.45", 0, 14, 15, "internal", "HTTPS"],
    [127, "wendy_fin", "10.0.0.95", 5, 4, 9400, "external", "FTP"],
    [128, "xavier_sales", "203.0.113.88", 0, 11, 20, "external", "HTTPS"],
    [129, "yara_hr", "192.168.1.50", 0, 17, 90, "internal", "HTTPS"],
    [130, "zack_temp", "198.51.100.33", 6, 12, 15, "external", "RDP"],
    [131, "aaron_eng", "10.0.0.101", 0, 0, 10, "internal", "HTTPS"],
    [132, "bella_qa", "192.168.1.55", 0, 13, 4000, "external", "SFTP"],
    [133, "cody_ext", "203.0.113.102", 11, 4, 30, "external", "SSH"],
    [134, "dana_ops", "192.168.1.60", 1, 10, 25, "internal", "HTTPS"],
    [135, "eli_it", "10.0.0.115", 0, 16, 70, "internal", "HTTPS"],
    [136, "fiona_sec", "198.51.100.58", 0, 3, 3100, "external", "SFTP"],
    [137, "george_dev", "192.168.1.65", 4, 15, 10, "internal", "SSH"],
    [138, "helen_fin", "203.0.113.66", 0, 11, 5, "external", "HTTPS"],
    [139, "ivan_admin", "10.0.0.120", 0, 2, 45, "internal", "HTTPS"],
    [140, "threat_actor", "198.51.100.77", 15, 2, 8000, "external", "RDP"],
    [141, "jenny_legal", "192.168.1.70", 0, 12, 22, "internal", "HTTPS"],
    [142, "kyle_eng", "10.0.0.130", 0, 14, 5100, "external", "SFTP"],
    [143, "lisa_hr", "203.0.113.15", 5, 8, 4, "external", "RDP"],
    [144, "mike_sales", "192.168.1.75", 0, 5, 12, "internal", "HTTPS"],
    [145, "nina_ops", "198.51.100.61", 0, 16, 85, "internal", "HTTPS"],
    [146, "oscar_temp", "10.0.0.140", 8, 1, 20, "internal", "SSH"],
    [147, "pam_dev", "192.168.1.80", 0, 10, 45, "internal", "HTTPS"],
    [148, "data_leaker", "203.0.113.120", 0, 13, 9900, "external", "FTP"],
    [149, "reese_sec", "198.51.100.105", 7, 3, 50, "external", "SSH"],
    [150, "sam_it", "192.168.1.90", 0, 15, 15, "internal", "HTTPS"]
]

columns = [
    "EventID", "User", "SourceIP", "FailedLogins", 
    "LoginHour", "TransferMB", "Destination", "Protocol"
]

df = pd.DataFrame(records, columns=columns)
df.to_excel("cybersecurity_events.xlsx", index=False)
print("File successfully created: cybersecurity_events.xlsx")