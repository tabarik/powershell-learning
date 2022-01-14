$PSVersionTable.PSVersion
<#<command-name> -<Required Parameter Name> <Required Parameter Value>
[-<Optional Parameter Name> <Optional Parameter Value>]
[-<Optional Switch Parameters>]
[-<Optional Parameter Name>] <Required Parameter Value>
#>
<#New-Alias [-Name] <string> [-Value] <string> [-Description <string>]
[-Force] [-Option {None | ReadOnly | Constant | Private | AllScope}]
[-PassThru] [-Scope <string>] [-Confirm] [-WhatIf] [<CommonParameters>]
The syntax is capitalized for readability, but PowerShell is case-insensitive.
ts alias, such a "gcm" for Get-Command.
#>
Get — To get something
Start — To run something
Out — To output something
Stop — To stop something that is running
Set — To define something
New — To create something<#
#>
Get-ExecutionPolicy
Get-Help -Name Get-Command -Full
Get-CimInstance -Class  Win32_LogicalDisk | Get-Member
Get-Service| Format-Table -Wrap
<#
gett - the details of date #>
(Get-Date).GetType()
Get-Alias
$var1 =1
$var1.GetType()
[int]$var1="2"
Write-Host "Found value $var1"
Get-Variable # for current session
get-something
$Error #Error is environment variable stores all values for the current session
$firstarray = @("Tapas","Baby","Little","Mama",8,5)
$firstarray[4]

#key Value pair 
$myhtable = @{"Fistname" ="Tapas"; "Lastname" ="Barik"}
$myhtable["Fistname"]
#if {} else {}
# regex -match 
#ctrl + j -snipet
<#
foreach ($item in $collection)
{
    
}

#>
$firstarray = @("Tapas","Baby","Little","Mama",8,5)
foreach($i in $firstarray)
{
    Write-Host $i
}

<#
.Synopsis
   Update service with stop or Restart
.DESCRIPTION
   Service will be start or stop based on start or stop status
.EXAMPLE
   Example of how to use this cmdlet
.EXAMPLE
   Another example of how to use this cmdlet
.INPUTS
   Inputs to this cmdlet (if any)
.OUTPUTS
   Output from this cmdlet (if any)
.NOTES
   General notes
.COMPONENT
   The component this cmdlet belongs to
.ROLE
   The role this cmdlet belongs to
.FUNCTIONALITY
   The functionality that best describes this cmdlet
#>
function Update-WindowsService
{
    [CmdletBinding()]
        
    Param
    (
        # Param1 help description
        [Parameter(Mandatory=$true, 
                   ValueFromPipeline=$true,
                   ValueFromPipelineByPropertyName=$true, 
                    Position=0)]        
        $ServiceName,

        # Param2 help description
        [Parameter(ParameterSetName='StopSet')]
        [switch]$Stop,

                # Param3 help description
        [Parameter(ParameterSetName='RestartSet')]
        [switch]$Restart
        
        )
    
    Begin
    {
        Write-Verbose "Updating Service $ServiceName....."
    }
    Process
    {
        if($Stop)
        {
            Set-Service -Name $ServiceName -Status Stopped
        }
        elseif($Restart)
        {
            Set-Service -Name $ServiceName -Status Running
        }
    }
    End
    {
        Write-Verbose " Service $ServiceName  Updated Successfully....."
    }
}
# This service requires to be run as administrator from Windows Powershell ISE
Get-PSProvider
# provider example cd HKLM:
<#1. Types of Error
.Terminating
Nn-terminating error#>
#whatif
Set-Service -Name ALG -Status Running
<#PS C:\WINDOWS\system32> Set-Service -Name ALG -Status Stopped -WhatIf
What if: Performing the operation "Set-Service" on target "Application Layer Gateway Service (ALG)".
Set-Service -Name ALG -Status Running -Confirm
#>
<#Powershell remoting -wsman -web services Management PRIOR TO WINDOWS REMOTE MANAGEMENT WAS DCOM
WINRM USES WSMAN WORK ON PORT HTTP /HTTPS PROTOCOL
TYPE OF REMOTING 
1. ADHOC REMOTING -DOES NOT NEED WINRM
2. INTERACTIVE REMOTING 
winrm service should be running , winrm powershel should be there . bY default 2012 there
But WIN7 winrm service not there 
#>
<#
[cmdletbinding(DefaultParameterSetName="Default")]
Param(
[Parameter(Position=0,Mandatory,HelpMessage="Enter the URI path starting with HTTP or HTTPS",
ValueFromPipeline,ValueFromPipelineByPropertyName)]
[ValidatePattern( "^(http|https)://" )]
[Alias("url")]
[string]$URI,
[Parameter(ParameterSetName="Detail")]
[Switch]$Detail,
[ValidateScript({$_ -ge 0})]
[int]$Timeout = 30
)
Begin {
    Write-Verbose -Message "Starting $($MyInvocation.Mycommand)" 
    Write-Verbose -message "Using parameter set $($PSCmdlet.ParameterSetName)" 
} #close begin block
Process {
    Write-Verbose -Message "Testing $uri"
    Try {
     #hash table of parameter values for Invoke-Webrequest
     $paramHash = @{
     UseBasicParsing = $True
     DisableKeepAlive = $True
     Uri = $uri
     Method = 'Head'
     ErrorAction = 'stop'
     TimeoutSec = $Timeout
    }
    $test = Invoke-WebRequest @paramHash
     if ($Detail) {
        $test.BaseResponse | 
        Select ResponseURI,ContentLength,ContentType,LastModified,
        @{Name="Status";Expression={$Test.StatusCode}}
     } #if $detail
     else {
       if ($test.statuscode -ne 200) {
            #it is unlikely this code will ever run but just in case
            Write-Verbose -Message "Failed to request $uri"
            write-Verbose -message ($test | out-string)
            $False
         }
         else {
            $True
         }
     } #else quiet
     
    }
    Catch {
      #there was an exception getting the URI
      write-verbose -message $_.exception
      if ($Detail) {
        #most likely the resource is 404
        $objProp = [ordered]@{
        ResponseURI = $uri
        ContentLength = $null
        ContentType = $null
        LastModified = $null
        Status = 404
        }
        #write a matching custom object to the pipeline
        New-Object -TypeName psobject -Property $objProp
        } #if $detail
      else {
        $False
      }
    } #close Catch block
} #close Process block
End {
    Write-Verbose -Message "Ending $($MyInvocation.Mycommand)"
} #close end block
 #close Test-URI Function

#>
