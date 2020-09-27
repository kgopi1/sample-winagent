
## Get DotNetVersion

(Get-ItemProperty "HKLM:SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Full").Release -ge 394802

$workdir="C:\buildagent\winrmsetup\" 

## Download Winrm script 

$url= "https://github.com/microsoft/azure-pipelines-extensions/blob/master/TaskModules/powershell/WinRM/WinRM-Http-Https/ConfigureWinRM.ps1"

Invoke-WebRequest -Uri $url -OutFile $workdir

cd \

cd $workdir




https://raw.githubusercontent.com/microsoft/azure-pipelines-extensions/master/TaskModules/powershell/WinRM/WinRM-Http-Https/ConfigureWinRM.ps1






