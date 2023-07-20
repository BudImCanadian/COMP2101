Get-CimInstance win32_networkadapterconfiguration | ? {$_.ipenabled} | format-table Description, Index, IPAddress, IPSubnet, DNSDomain, DNSServerSearchOrder
