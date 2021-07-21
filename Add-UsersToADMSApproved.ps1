$ITUsers = Get-ADUser -Filter * -SearchBase 'OU=IT,OU=Spirit Users,DC=spirit,DC=local'

$ITUsers = Get-ADUser -Filter {cn -notlike '*(PA)'} SearchBase 'OU=IT,OU=Spirit Users,DC=spirit,DC=local'


$ITUsersPA = Get-ADUser -Filter {cn -like '*(PA)'} -SearchBase 'OU=IT,OU=Spirit Users,DC=spirit,DC=local' | select Name

$Group = 'ADMS.Approved.Migration.Users'



$ITUsers.count
Get-ADGroup $Group

Add-ADGroupMember -Identity $Group -Members $ITUsers

Remove-ADGroupMember -Identity $Group -Members $ITUsersPA


Get-ADGroupMember -Identity $Group | measure