# 🖥️ System Monitoring and Resource Usage Tool

A **Bash script-based System Health Monitor** designed to quickly check the status and resource usage of a Linux system. This tool provides detailed insights into system performance, connectivity, hardware specs, and current resource utilization — all in a colorful and user-friendly terminal display.

---

## 📌 Features

- ✅ **Internet Connectivity Check**
- 🧠 **Operating System Details**
- 🧭 **Hostname, IPs (Internal & External), and MAC Address**
- 🌐 **DNS Name Servers**
- ⚙️ **CPU Info (Model, Cores, Architecture, etc.)**
- 💽 **Total RAM & Disk Information**
- 👤 **Logged-In Users**
- 📊 **Real-Time RAM & Swap Usage**
- 📁 **Disk Usage by Mount Points**
- ⏳ **System Uptime**

---

## 💡 Usage

### 🔧 Requirements
- Bash Shell
- Common Linux utilities:
  - `ping`, `lsb_release`, `curl`, `ip`, `lscpu`, `df`, `free`, `hostname`, `who`, `uname`, `awk`, `grep`, `sed`, `lsblk`

These utilities are typically pre-installed on most Linux distributions.

---

### 🚀 Run the Script

Make sure the script is executable:

```bash
chmod +x monitor.sh
```
Then exexute the script using the following command:
```bash
./monitor.sh
```
