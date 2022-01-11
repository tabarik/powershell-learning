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