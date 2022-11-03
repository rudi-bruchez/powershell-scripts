# ----------------------------------------------------------------
# Adds a local Windows user 
#
# rudi@pachadata.com, go ahead license
# ----------------------------------------------------------------

$Name = "Name"
$FullName = "Full Name"
$Password = Read-Host -AsSecureString

New-LocalUser $Name -Password $Password -FullName $FullName
Add-LocalGroupMember -Group "Administrators" -Member $Name