# Import the Active Directory module (uncomment in production)
# Import-Module ActiveDirectory

param (
    [string]$UserName,
    [string]$givenName,
    [string]$initials,
    [string]$sn,
    [string]$displayName,
    [string]$description,
    [string]$physicalDeliveryOfficeName,
    [string]$telephoneNumber,
    [string]$otherTelephone,
    [string]$mail,
    [string]$wWWHomePage,
    [string]$url,
    [string]$CN,
    [string]$streetAddress,
    [string]$postOfficeBox,
    [string]$l,
    [string]$st,
    [string]$postalCode,
    [string]$c,
    [string]$memberOf,
    [string]$userPrincipalName,
    [string]$sAMAccountName,
    [string]$homePhone,
    [string]$otherHomePhone,
    [string]$pager,
    [string]$otherPager,
    [string]$mobile,
    [string]$otherMobile,
    [string]$facsimileTelephoneNumber,
    [string]$otherFacsimile,
    [string]$ipPhone,
    [string]$otherIpPhone,
    [string]$info,
    [string]$title,
    [string]$department,
    [string]$company,
    [string]$manager,
    [string]$employeeID,
    [string]$employeeType,
    [string]$employeeNumber,
    [string]$carLicense,
    [string]$division,
    [string]$roomNumber,
    [string]$mailNickname,
    [string]$displayNamePrintable,
    [string]$proxyAddresses,
    [string]$extensionAttribute1,
    [string]$extensionAttribute2,
    [string]$extensionAttribute3,
    [string]$extensionAttribute4,
    [string]$extensionAttribute5,
    [string]$extensionAttribute6,
    [string]$extensionAttribute7,
    [string]$extensionAttribute8,
    [string]$extensionAttribute9,
    [string]$extensionAttribute10,
    [string]$extensionAttribute11,
    [string]$extensionAttribute12,
    [string]$extensionAttribute13
)


[string]$DomainController = [string](Get-ADDomainController -Discover -forceDiscover -Writable).HostName
# Set default parameter values for Active Directory cmdlets
# This will set the server parameter to the retrieved domain controller hostname.
$PSDefaultParameterValues['*-AD*:Server'] = $DomainController # Set the server parameter to the retrieved domain controller hostname.
$PSDefaultParameterValues['*-AD*:Identity'] = $UserName # Set the username parameter as default for all ad commands.


# Function to update AD user attributes
function Update-ADUserAttributes {
    param (
        [string]$UserName,
        [hashtable]$Attributes
    )

    try {
        # Check if the user exists (uncomment in production)
        # $user = Get-ADUser -ErrorAction Stop

        # Create a hashtable for the attribute updates
        $attributeUpdate = @{}
        $attributesToClear = @()

        foreach ($key in $Attributes.Keys) {
            if ($Attributes[$key] -eq "clearattribute") {
                $attributesToClear += $key
            } elseif (-not [string]::IsNullOrWhiteSpace($Attributes[$key])) {
                $attributeUpdate[$key] = $Attributes[$key]
            }
        }

        if ($attributeUpdate.Count -eq 0 -and $attributesToClear.Count -eq 0) {
            Write-Host "No attributes to update or clear for user '$UserName'."
        } else {
            # Update the attributes
            if ($attributeUpdate.Count -ne 0) {
                # Set-ADUser @attributeUpdate -ErrorAction Stop
                Write-Host "Successfully updated the attributes for user '$UserName'."
            }
            # Clear the attributes
            if ($attributesToClear.Count -ne 0) {
                # Set-ADUser -Clear $attributesToClear -ErrorAction Stop
                Write-Host "Successfully cleared the attributes for user '$UserName'."
            }
        }
    } catch {
        Write-Error "Failed to update or clear the attributes for user '$UserName'. Error: $_"
    }
}

# Main script logic
$attributes = @{}

foreach ($param in $PSBoundParameters.Keys) {
    if ($param -ne "UserName" -and -not [string]::IsNullOrWhiteSpace($PSBoundParameters[$param])) {
        $attributes[$param] = $PSBoundParameters[$param]
    }
}

# Call the function to update the attributes
Update-ADUserAttributes -UserName $UserName -Attributes $attributes

# Return the attributes hashtable
return $attributes
