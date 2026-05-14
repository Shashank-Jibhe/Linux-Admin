# 🔐 SSH Log Analyzer

A Python-based log analysis tool that detects failed SSH login attempts using system logs (`journalctl`)  
This project simulates real-world monitoring and forms the foundation for an AI-powered AIOps system.

---

## 🚀 Features

- Parses system logs using `journalctl`
- Detects failed SSH login attempts
- Filters relevant authentication logs (`sshd`)
- Handles inconsistent real-world log formats
- Displays alert-style output for visibility

---

## 🛠️ Tech Stack

- Python 3
- Linux (RHEL 10.1)
- systemd (`journalctl`)
- OpenSSH (`sshd`)

---

## 📂 Project Structure

```
.
├── ssh_log_analyzer.py
└── README.md
```

---

## ⚙️ Setup & Usage

### 1. Ensure SSH service is running
```bash
sudo systemctl start sshd
sudo systemctl enable sshd
```

### 2. Generate failed login attempts (for testing)
```bash
ssh hrusr1@localhost
```

### 3. Run the script
```bash
sudo python3 ssh_log_analyzer.py
```

---

## 🧪 Sample Output

```
[ALERT] SSH Login Failure:
Apr 15 20:35:28 hostname sshd-session[7168]: Failed password for user hrusr1 from ::1 port 33168 ssh2
--------------------------------------------------
```

---

## 🧠 Learn

### Python:
- Using `subprocess` to run Linux commands
- Looping and parsing command output
- Conditional filtering

### Linux:
- `journalctl` vs traditional logs
- `systemd-journald` basics
- Service-based log filtering (`-u sshd`)

### SSH:
- `ssh` (client) vs `sshd` (server)
- Authentication logging behavior
- Generating test failures

---

## 💥 Break (Challenges Faced)

- Permission denied errors when accessing logs  
- Logs not appearing due to incorrect filters  
- Confusion between `ssh` vs `sshd`  
- Python syntax error (`capture_output` typo)  
- Script running but returning no output  
- Mixed log formats (PAM vs SSH logs)  

---

## 🔧 Fix (Solutions Applied)

- Used `sudo` for log access  
- Targeted correct service (`sshd`)  
- Generated real log data for testing  
- Debugged using Python tracebacks  
- Refined filtering based on actual logs  

---

## 🔍 Key Insights

- Logs are not standardized  
- Debugging = verifying assumptions  
- `::1` = localhost (IPv6)  
- PAM logs ≠ SSH logs  
- Filtering at source improves performance  

---

## 🧩 Outcome

- Functional SSH log analyzer  
- Real understanding of Linux logging  
- Strong base for AIOps projects  

---

## 🔜 Next Steps

- AI-based log summarization  
- Extract structured data (IP, user, timestamp)  
- Add alerting (email/Slack)  
- Expand to system login monitoring  

---


