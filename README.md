# System Monitoring Script
 shell script to monitor system performance (CPU and memory usage) and generate periodic reports
 


Shell Script: monitor_performance.sh

 

Monitoring Function:

The log_performance function collects the current system time, CPU usage, and memory usage.
It uses top to fetch CPU usage, parses it with awk and sed, and then calculates the CPU usage by subtracting idle percentage from 100%.
Memory usage is obtained using the free command, and it calculates memory usage as a percentage.

Report Generation: The script will generate REPORT_COUNT number of reports (set to 10 by default) at the defined INTERVAL (set to 60 seconds by default).
Each report is appended to the log file with a timestamp.

Sleep Interval: After each report generation, the script waits for the specified interval (60 seconds in this case) before the next report is created.

Completion: Once the specified number of reports are generated, the script outputs a completion message.

Usage:
Save the script to a file, e.g., monitor_performance.sh.

Customization:
Adjust the INTERVAL to change the frequency of reports.
Change REPORT_COUNT to control how many reports are generated.
You can adjust the log file path as per your requirements.
This script is a basic example; you can enhance it further by adding error handling, logging additional system parameters (e.g., disk usage, network), or sending email alerts based on thresholds.



