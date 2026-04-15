import subprocess

result = subprocess.run(
        ["journalctl", "-u", "sshd", "-n", "100"],
        capture_output=True,
        text=True
        )

for line in result.stdout.split("\n"):
    line_lower = line.lower()

    if "failed" in line_lower or "invalid" in line_lower:
        print("[ALERT] Failed SSH login detected:")
        print(line)
        print("-" * 50)

        if "failed" in line_lower:
            print("[ALERT]", line.split("from")[-1])
