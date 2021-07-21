$Scope = '10.5.220.0'

#$DHCPScope = Get-DhcpServerv4Scope -ScopeId $Scope

$DHCPScopeLease = Get-DhcpServerv4Lease -ScopeId $Scope

#Show DHCP Scope leases
$DHCPScopeLease