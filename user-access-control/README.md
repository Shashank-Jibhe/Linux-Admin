# Linux User Access Control Lab

## 📌 Scenario
Simulated a real-world enterprise setup where multiple departments require controlled access to shared directories, while maintaining strict security and audit visibility.

---

## 🎯 Objectives
- Implement user and group-based access control
- Restrict cross-department access
- Enable secure collaboration within teams
- Provide read-only audit access

---

## 🧱 Setup Overview

### Users Created
- dev1, dev2 → Development team
- hr1 → HR team
- auditor1 → Audit team

### Groups Created
- dev
- hr
- audit

---

## 🔐 Access Control Design

| Directory        | Access        |
|----------------|--------------|
| /projects/dev  | dev group (rw) |
| /projects/hr   | hr group (rw)  |
| Auditor        | read-only everywhere |

---

## ⚙️ Key Concepts Used

- **User & Group Management** (`useradd`, `usermod`)
- **Permissions** (`chmod`, `chown`)
- **setgid** → ensures group inheritance
- **umask** → controls default file permissions
- **ACL** → fine-grained access control for auditor

---

## 🧪 Problems Faced & Fixes

### Issue 1: Group collaboration failed
- Files were created with incorrect group (dev1 instead of dev)
- Fix:
  - Enabled `setgid` on directory

### Issue 2: Team could not edit files
- Default permissions were `rw-r--r--`
- Fix:
  - Adjusted `umask` to `002`

### Issue 3: Auditor access required without full permissions
- Fix:
  - Implemented ACL (`setfacl`)

---

## 🚀 How to Run

```bash
chmod +x scripts/setup.sh
sudo ./scripts/setup.sh

✅ Validation
Dev users can access /projects/dev
HR users can access /projects/hr
Cross-access is restricted
Auditor has read-only access
New files inherit correct group (setgid working)
