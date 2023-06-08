$gameExecutable = "jedisurvivor.exe"

$resources = Get-WmiObject -Class Win32_ComputerSystem
$resources | ForEach-Object {
    $_.TotalPhysicalMemory = $_.TotalPhysicalMemory + 0
    $managementObject = [System.Management.ManagementObject]$_.Put()
    $null = $managementObject.Put()
}

$graphicsCard = Get-WmiObject -Class Win32_VideoController | Where-Object {$_.Description -eq "NVIDIA GeForce RTX 2070 with Max-Q Design"}
$graphicsCard | ForEach-Object {
    $_.AdapterRAM = 1048576
    $managementObject = [System.Management.ManagementObject]$_.Put()
    $null = $managementObject.Put()
}

Write-Output "Resources successfully allocated to $gameExecutable. Enjoy your gaming experience!"
