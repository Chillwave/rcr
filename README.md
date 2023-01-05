Running Config Reader (RCR)

This script reads a file containing network device running configuration data in a cisco "show running-config" format and parses the data to extract relevant information about names, interfaces, static routes, routing protocols, VPNs, access control policies, and QoS policies. The extracted information is then saved to a report file. It was designed for network technicians who may not have acess to a terminal or WSL(Windows Subsystem Linux).

Prerequisites
PowerShell must be installed on the system. Make sure you run "set-executionpolicy -executionpolicy unrestricted" as an admin prior.
Running the script
To run the script, open a PowerShell window and navigate to the directory where the script is located. Then enter the following command:

Copy code
.\running config reader.ps1 [input file]
Replace [input file] with the name of the input file containing the running configuration data. If no input file is specified, the script will use the default input file "input.txt".

The generated report will be saved to a file named in the format "dd-MM-yyyy_report.txt" in the same directory as the script.

Additional Information
If the input file specified does not exist, the script will exit with an error.
The script expects the input file to be in a specific format, with each line starting with a keyword followed by relevant data. If the input file is not in this format, the script may not be able to parse the data correctly.

