#####################################################
# HelloID-Conn-Prov-SOURCE-SAP
#
# Version: 1.0.0
#
# Requirements:
#
# SAP connector DLL's
# Windows PowerShell 5.1
#####################################################

function Import-SAPPersonData {
    <#
    .SYNOPSIS
    Imports the SAP persons into HelloID

    .DESCRIPTION
    Imports the SAP persons into HelloID

    .PARAMETER ConnectionSetName
    The Name of the SAPConfigParameter set

    .PARAMETER HostName
    The HostName of the SAP server where the SAP system in installed

    .PARAMETER SysId
    The ID of the SAP system

    .PARAMETER SysNr
    The Number of SAP system

    .PARAMETER Client
    The Client of the SAP system

    .PARAMETER UserName
    The UserName to connect the SAP system

    .PARAMETER Password
    The Password to connect the SAP system

    .PARAMETER SAPdllDirectoryPath
    The directory where the SAP connector dll's are located

    .PARAMETER FunctionCall
    The name of the functionCall. This is specified within SAP. The function call must be configured to retrieve the requested data from SAP

    .PARAMETER TableName
    The name of the table in which the user data is stored
    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [String]
        $ConnectionSetName,

        [Parameter(Mandatory)]
        [String]
        $HostName,

        [Parameter(Mandatory)]
        [String]
        $SysId,

        [Parameter(Mandatory)]
        [String]
        $SysNr,

        [Parameter(Mandatory)]
        [String]
        $Client,

        [Parameter(Mandatory)]
        [String]
        $UserName,

        [Parameter(Mandatory)]
        [SecureString]
        $Password,

        [String]
        $SAPdllDirectoryPath,

        [Parameter(Mandatory)]
        [String]
        $FunctionCall,

        [Parameter(Mandatory)]
        [String]
        $TableName
    )

    try {
        $splatInitilizeSAPEnvironment = @{
            Name                = $ConnectionSetName
            HostName            = $HostName
            SysID               = $SysId
            SysNR               = $SysNr
            Client              = $Client
            UserName            = $UserName
            Password            = $Password
            SAPdllDirectoryPath = $SAPdllDirectoryPath
        }
        $connectionSettings = Initialize-SAPEnvironment @splatInitilizeSAPEnvironment
    } catch {
        Write-Error "could not initialize SAP environment. Error: $($_.Exception.Message)"
    }

    try {
        $persons = Get-SAPUser -ConnectionSettings $connectionSettings -FunctionCall $FunctionCall -TableName $TableName

        foreach ($person in $persons){
            $person | ConvertTo-Json -Depth 10
        }
    } catch {
        Write-Error "could not import SAP persons in HelloID. Error: $($_.Exception.Message)"
    }
}

function Initialize-SAPEnvironment {
    <#
    .SYNOPSIS
    Creates a new object containing the SAP config parameters

    .DESCRIPTION
    Creates a new object of type [SAP.Middleware.Connector.RfcConfigParameters] that will be used to connect to SAP

    .PARAMETER ConnectionSetName
    The Name of the SAPConfigParameter set

    .PARAMETER HostName
    The HostName of the SAP server where the SAP system in installed

    .PARAMETER SysId
    The ID of the SAP system

    .PARAMETER SysNr
    The Number of SAP system

    .PARAMETER Client
    The Client of the SAP system

    .PARAMETER UserName
    The UserName to connect the SAP system

    .PARAMETER Password
    The Password to connect the SAP system

    .PARAMETER SAPdllDirectoryPath
    The directory where the SAP connector dll's are located
    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [String]
        $ConnectionSetName,

        [Parameter(Mandatory)]
        [String]
        $HostName,

        [Parameter(Mandatory)]
        [String]
        $SysId,

        [Parameter(Mandatory)]
        [String]
        $SysNr,

        [Parameter(Mandatory)]
        [String]
        $Client,

        [Parameter(Mandatory)]
        [String]
        $UserName,

        [Parameter(Mandatory)]
        [SecureString]
        $Password,

        [String]
        $SAPdllDirectoryPath
    )

    try {
        Add-Type -Path "$SAPdllDirectoryPath\sapnco.dll"
        Add-Type -Path "$SAPdllDirectoryPath\sapnco_utils.dll"

        $bstr = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($Password)
        $passwordString = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($bstr)

        $cfgParams = New-Object SAP.Middleware.Connector.RfcConfigParameters
        $cfgParams.Add("NAME", $ConnectionSetName)
        $cfgParams.Add("ASHOST", $HostName)
        $cfgParams.Add("SYSID", $SysId)
        $cfgParams.Add("SYSNR", $SysNr)
        $cfgParams.Add("CLIENT", $Client)
        $cfgParams.Add("USER", $UserName)
        $cfgParams.Add("PASSWD", $passwordString)

        Write-Output $cfgParams
    } catch {
        $PSCmdlet.ThrowTerminatingError($PSItem)
    }
}

function Get-SAPUser {
    <#
    .SYNOPSIS
    Example call that shows how to retrieve data from SAP

    .DESCRIPTION
    This is an example function that shows how to retrieve data from the SAP system using bapi function calls. This function doesn't work out of the box. Changes will have to be made in the code according to your own needs

    .PARAMETER ConnectionSettings
    The connectionSettings specified on the <Configuration> tab within HelloID

    .PARAMETER FunctionCall
    The name of the functionCall. This is specified within SAP. The function call must be configured to retrieve the requested data from SAP

    .PARAMETER TableName
    The name of the table in which the user data is stored
    #>
    [OutputType([System.Collections.Generic.List[object]])]
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        $ConnectionSettings,

        [Parameter(Mandatory)]
        [String]
        $FunctionCall,

        [Parameter(Mandatory)]
        [String]
        $TableName
    )

    try {
        $destination = [SAP.Middleware.Connector.RfcDestinationManager]::GetDestination($ConnectionSettings)
        $repository = $destination.Repository

        [SAP.Middleware.Connector.IRfcFunction]$bapiFunctionCall = $repository.CreateFunction($FunctionCall)

        $bapiFunctionCall.Invoke($destination)

        [System.Collections.Generic.List[object]]$resultList = @()
        [SAP.Middleware.Connector.IRfcTable]$returnData = $bapiFunctionCall.GetTable($TableName)

        foreach ($item in $returnData) {
            $obj = [PSCustomObject]@{
                "ExternalID"              = $user.GetValue("EXTERNAL_ID")
                "Initials"                = $user.GetValue("INITIALS")
                "NickName"                = $user.GetValue("NICKNAME")
                "GivenName"               = $user.GetValue("GIVEN_NAME")
                "FamilyNamePrefix"        = $user.GetValue("FAMILY_NAME_PREFIX")
                "FamilyName"              = $user.GetValue("FAMILY_NAME")
                "FamilyNamePartnerPrefix" = $user.GetValue("FAMILY_NAME_PARTNER_PREFIX")
                "FamilyNamePartner"       = $user.GetValue("FAMILY_NAME_PARTNER")
                "FamilyNameFormatted"     = $user.GetValue("FAMILY_NAME_FORMATTED")
                "NameSeperator"           = $user.GetValue("NAME_SEPARATOR")
                "Convention"              = $user.GetValue("CONVENTION")
                "Birthdate"               = $user.GetValue("BIRTHDATE")
                "Phone"                   = $user.GetValue("PHONE")
            }
            $resultList.Add($obj)
        }

        Write-Output $resultList
    } catch {
        $PSCmdlet.ThrowTerminatingError($PSItem)
    }
}
