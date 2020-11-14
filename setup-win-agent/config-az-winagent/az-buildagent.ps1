[CmdletBinding()]
param (
    [string] $orgname,
    [string] $pat_token,
    [string] $agent
)

## Variables declaration
$agent = "az-kg-win-agent"
$url = "https://dev.azure.com/$orgname"
$agent_url = "https://vstsagentpackage.azureedge.net/agent/2.175.2/vsts-agent-win-x64-2.175.2.zip"
$build_version = $agent_url.Split("/")[4]
##create agent directory ##


#$workdir = "C:\buildagent" 
$workdir = "\devops"
$path_status = Test-Path $workdir 
if ($false -eq $path_status) {
    New-Item -ItemType Directory -Path $workdir
    Write-Host "Path created"
}
else {
    Write-Host "Path already exists."
}

###Download the file 

try {
    Set-Location $workdir
    Invoke-WebRequest -Uri $agent_url -OutFile $workdir\$build_version.zip
    Write-Host "Succesfully Download the Agent $build_version"
}
catch {
    throw "Unable to download the agent"
    
}

try {
    #Expand-Archive -Path $workdir\$build_version.zip -DestinationPath $workdir
    #Invoke-Expression config.cmd --unattended --url $url --auth pat: --token $pat_token --agent $agent --pool "Default" --runAsService 
}
catch {
    throw "Unable to extact the file / run the script"
}



###  Extact and Install the build ##

