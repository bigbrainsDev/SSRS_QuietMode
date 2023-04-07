param (
    [string]$DisableQuietMode = "false"
)

# Load the config file
$config = [xml](get-content "C:\Program Files\Microsoft SQL Server Reporting Services\SSRS\ReportServer\rsreportserver.config")

# Change the values
$config.Configuration.Service.IsSchedulingService = $DisableQuietMode.ToString().ToLower()
$config.Configuration.Service.IsNotificationService = $DisableQuietMode.ToString().ToLower()
$config.Configuration.Service.IsEventService = $DisableQuietMode.ToString().ToLower()

# Save the config file
$config.Save("C:\Program Files\Microsoft SQL Server Reporting Services\SSRS\ReportServer\rsreportserver.config")