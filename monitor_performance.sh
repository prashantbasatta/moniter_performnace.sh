

#!/bin/bash

# Define the log file path and the interval for report generation
LOG_FILE="/var/log/system_performance_report.log"
INTERVAL=60  # Time interval between reports in seconds (adjust as needed)
REPORT_COUNT=10  # Number of reports to generate

# Check if the log file exists, if not create it
if [ ! -f "$LOG_FILE" ]; then
  touch "$LOG_FILE"
fi

# Function to log system performance
log_performance() {
  # Get the current timestamp
  TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")
  
  # Get the CPU usage
  CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')
  
  # Get the memory usage
  MEM_USAGE=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
  
  # Append the data to the log file
  echo "$TIMESTAMP - CPU Usage: $CPU_USAGE% - Memory Usage: $MEM_USAGE%" >> "$LOG_FILE"
}

# Start monitoring and generating reports
for i in $(seq 1 $REPORT_COUNT); do
  log_performance
  echo "Report $i generated at $(date)"
  sleep $INTERVAL
done

echo "Performance monitoring completed. Reports are saved in $LOG_FILE."
