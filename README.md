# SSRS_QuietMode

# Step 1: Save the below PowerShell file in a location, Example: Desktop 

PowerShell 
param (
    [string]$IsQuietMode = "false"
)

# Load the config file 

$config = [xml](get-content "C:\Program Files\Microsoft SQL Server Reporting Services\SSRS\ReportServer\rsreportserver.config") 

 
 

# Change the values 

$config.Configuration.Service.IsSchedulingService = $DisableQuietMode.ToString().ToLower() 

$config.Configuration.Service.IsNotificationService = $DisableQuietMode.ToString().ToLower() 

$config.Configuration.Service.IsEventService = $DisableQuietMode.ToString().ToLower() 

 
 

# Save the config file 

$config.Save("C:\Program Files\Microsoft SQL Server Reporting Services\SSRS\ReportServer\rsreportserver.config") 

 

Note that the script assumes the config file is located at C:\Program Files\Microsoft SQL Server Reporting Services\SSRS\ReportServer\rsreportserver.config You may need to adjust the path to match your system. 

 
# Step 2: Run command prompt in “Run as Administrator”: 

 
# Step 3: Change the path of the location to where the PowerShell file locate. Example: C:\Users\Sean\Desktop\configure_QuietMode.ps1  
 
# Step 4: Run the below command by changing the DisableQuietMode to "true" or "false":  

CMD Prompt  

powershell -ExecutionPolicy Bypass -File .\configure_QuietMode.ps1 -IsQuietMode "true" 

# References 

Turn Reporting Services Features On or Off - SQL Server Reporting Services (SSRS) | Microsoft Learn 
https://learn.microsoft.com/en-us/sql/reporting-services/report-server/turn-reporting-services-features-on-or-off?view=sql-server-ver16
