try {
    # Powershell Settings
    Update-ExecutionPolicy Unrestricted -Force
    
    # Windows Settings
    Set-ExplorerOptions -showProtectedOSFiles -showFileExtensions
    
    # OneGet Config
    Install-Package -Provider bootstrap NuGet
    Install-Package -Provider bootstrap chocolatey
    
    # Chocolatey Packages
    $c =
        "visualstudiocode",
        "git",
        "git-credential-manager-for-windows",
        "putty",
        "winscp",
        "angryip",
        "7zip",
        "fiddler4",
        "dropbox",
        "curl"
    $c.ForEach({ 
        cinst $_ -y 
    })
    
   # Chocolatey Windows Packages
   $w =
        "TelnetClient",
        "TFTP"
   $w.ForEach({
       cinst $_ -y -source windowsFeatures
   })
   
   # Powershell Modules
   Install-Module AzureRM
   Install-AzureRM
   Install-Module Azure
   Import-AzureRM
   
   # Download Powershell Modules 
   cd $env:HOMEPATH\Downloads
   $m =
        "https://www.microsoft.com/en-us/download/confirmation.aspx?id=41950", # MSOnline Sign In Assistant
        "http://go.microsoft.com/fwlink/p/?linkid=236297", # AzureAD
        "https://www.microsoft.com/en-us/download/confirmation.aspx?id=35588", # Sharepoint Online
        "https://www.microsoft.com/en-us/download/confirmation.aspx?id=39366" # Lync Online
   $m.ForEach({
       curl -O $_
   })
   
   
    Write-ChocolateySuccess 'WorkPC'
} catch {
  Write-ChocolateyFailure 'WorkPC' $($_.Exception.Message)
  throw
}