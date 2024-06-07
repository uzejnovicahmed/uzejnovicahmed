# This script triggers the Update-ADUserAttributes.ps1 script with dummy values

# Dummy values for the parameters
$params = @{
    UserName = "jdoe"
    givenName = "John"
    initials = "JD"
    sn = "Doe"
    displayName = "John Doe"
    description = "Sales Manager"
    physicalDeliveryOfficeName = "London Office"
    telephoneNumber = "949-555-1234"
    otherTelephone = "949-555-1234"
    mail = "JSmith@domain.com"
    wWWHomePage = "www.johnsmith.com"
    url = "www.Company.net"
    CN = "John Smith"
    streetAddress = "10 The Road"
    postOfficeBox = "PO Box 1"
    l = "New London"
    st = "New York"
    postalCode = "61441"
    c = "US"
    memberOf = "CN=Managers,OU=Sales,DC=Domain,DC=Com"
    userPrincipalName = "JSmith@domain.com"
    sAMAccountName = "JSmith"
    homePhone = "949-555-1234"
    otherHomePhone = "949-555-1234"
    pager = "949-555-1234"
    otherPager = "949-555-1234"
    mobile = "949-555-1234"
    otherMobile = "949-555-1234"
    facsimileTelephoneNumber = "949-555-1234"
    otherFacsimile = "949-555-1234"
    ipPhone = "949-555-1234"
    otherIpPhone = "949-555-1234"
    info = "General information"
    title = "Manager"
    department = "Sales"
    company = "Big Corp"
    manager = "CN=SJobs,OU=Managers,DC=Domain,DC=Com"
    employeeID = "12345"
    employeeType = "Full-Time"
    employeeNumber = "67890"
    carLicense = "ABC-123"
    division = "Sales Division"
    roomNumber = "clearattribute"
    mailNickname = "jsmith"
    displayNamePrintable = "James Smith"
    proxyAddresses = "SMTP:jsmith@domain.com"
    extensionAttribute1 = "ext1"
    extensionAttribute2 = "ext2"
    extensionAttribute3 = "ext3"
    extensionAttribute4 = "ext4"
    extensionAttribute5 = "ext5"
    extensionAttribute6 = "ext6"
    extensionAttribute7 = "ext7"
    extensionAttribute8 = "ext8"
    extensionAttribute9 = "ext9"
    extensionAttribute10 = "ext10"
    extensionAttribute11 = "ext11"
    extensionAttribute12 = "ext12"
    extensionAttribute13 = "clearattribute"
}



$params = @{
    UserName = "jdoe"
    givenName = "John"
    initials = "JD"
    sn = "Doe"
    displayName = "John Doe"
    description = "Sales Manager"
    physicalDeliveryOfficeName = "London Office"
    displayNamePrintable = "James Smith"
    proxyAddresses = "SMTP:jsmith@domain.com"
    extensionAttribute1 = ""
}




.\Update_AD_User_Attributes.ps1 @params -verbose


