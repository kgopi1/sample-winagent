function install-azmodule(name) {
    try {
        Install-PackageProvider -Name Nuget -Confirm:$false -Force 
        Install-Module -Name $name -Confirm:$false -Force
    }
    catch {
        throw "unable to intall the modules"
        
    }
    
}



## main 
install-module(AzureAD)
