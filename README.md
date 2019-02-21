# Container to act as a DHCP server.

Takes `tenant_id` and `interface` as environment variables to answer DHCP
requests on interface $interface with dhcp-range 
`10.8.$tenant_id.10,10.8.$tenant_id.250,255.255.255.0,10.8.$tenant_id.1,5m`.
