# ----------------------------------------------------------------
# Tests STMP server using Powershell, with authentication if
# required
# remove -UseSsl if SSL is not supported by the SMTP server
#
# rudi@pachadata.com, go ahead license
# ----------------------------------------------------------------

$EmailTo    = "rudi@pachadata.com"
$EmailFrom  = "rudi@pachadata.com"
$Subject    = "Test 01" 
$Body       = "Test Body 01" 
$SmtpServer = "smtp.server.com" 

# -------- authentication if needed -------------
$SmtpLogin    = "login"
$SmtpPassword = "password"

$secpasswd = ConvertTo-SecureString $SmtpPassword -AsPlainText -Force
$cred = New-Object System.Management.Automation.PSCredential ($SmtpLogin, $secpasswd)
# -----------------------------------------------

# with authentication
Send-MailMessage -SmtpServer $SmtpServer -Credential $cred -UseSsl -From $EmailFrom -To $EmailTo -Subject $Subject -Body $Body

# without authentication
Send-MailMessage -SmtpServer $SmtpServer -UseSsl -From $EmailFrom -To $EmailTo -Subject $Subject -Body $Body
