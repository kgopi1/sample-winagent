function install-module {
    param (
  
        [string]$ModuleName
    )

    try {
        Write-Host "$ModuleName module will be installed"
        Install-PackageProvider -Name Nuget -Confirm:$false -Force 
        Install-Module -Name $ModuleName -Confirm:$false -Force
    }
    catch {
        throw "unable to intall the modules"
        
    }
    
}


## main 
install-module AzureAD
