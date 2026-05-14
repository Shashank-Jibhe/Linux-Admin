# Linux Administration Projects

## Projects

### 1. SSH Log Analyzer
Python tool to analyze SSH logs for suspicious activity.

### 2. User Access Control Lab
Simulates enterprise-level user and permission management:
- Group-based access control
- setgid for inheritance
- umask tuning
- ACL for audit access
- Real-world debugging scenarios

### 3. Shared Access Control

In multi-user Linux environments, it is common for teams to require shared access to files and directories while maintaining security and accountability.

This project demonstrates how to implement shared access control using:

- User groups
- File permissions (chmod)
- Ownership management (chown)
- Access Control Lists (ACLs)

### 4. System Monitoring & Automation
- Built a bash script to monitor CPU, memory, and disk usage
- Implemented alert system based on thresholds
- Logged system activity to file
- Automated execution using cron

### 5. Log Rotation & Cleanup Automation
- Built a script to rotate and compress logs
- Implemented timestamp-based archiving
- Designed retention policy to delete old logs
- Automated cleanup using cron

### 6. Service Monitoring & Auto-Restart

- Built a bash script to monitor `sshd` service status
- Automatically restarts the service if it is down
- Logs normal and failure states
- Configured root cron for automated service checks
- Demonstrates basic self-healing system behavior

---
