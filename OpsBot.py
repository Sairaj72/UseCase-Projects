import os

f = open("server.log", "r")

error = 0
critical = 0
failed = 0

critical_lines = []

for line in f:
    line = line.strip()

    if "ERROR" in line:
        error += 1

    if "CRITICAL" in line:
        critical += 1
        critical_lines.append(line)

    if "FAILED LOGIN" in line:
        failed += 1

f.close()

log_data = {
    "ERROR": error,
    "CRITICAL": critical,
    "FAILED LOGIN": failed
}
print(log_data)

out = open("security_alert.txt", "w")

for l in critical_lines:
    out.write(l + "\n")

out.close()

size = os.path.getsize("security_alert.txt")
print("File created. Size:", size, "bytes")