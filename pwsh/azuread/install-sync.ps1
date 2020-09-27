





function install-azmodule {
    try {
        Install-PackageProvider -Name Nuget -Confirm:$false -Force 
        Install-Module -Name AzureAD -Confirm:$false -Force
    }
    catch {
        throw "unable to intall the modules"
        
    }
    
}



## main 
install-azmodule
