The log_monitor.sh file will find new entries in a specified log file which will be passed as run time input

cleanup function is used to stop the monitoring of the log file

for Graceful Termination of the monitoring , adding cleanup function to SIGINT

Using a IF condition, we will check whether the input is passed or not

And using another If condition, I'm checking whether the log file exists or not

Using tail command, I'm displaying last few lines in the given log file

Using while loop to iterate through each line and checking for the given key words and counting the number of times the given key word exists and displays the error count

Finally calling the cleanup function to stop the monitoring
