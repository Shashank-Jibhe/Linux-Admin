# SSH Log Analyzer

A Python-based tool that detects failed SSH login attempts using system logs.

## Features
- Parses logs using journalctl
- Detects failed SSH logins
- Displays alert output

## Usage

Run:
sudo python3 ssh_log_analyzer.py

## Sample Output

[ALERT] SSH Login Failure:
Failed password for user test from ::1 port 33168 ssh2
