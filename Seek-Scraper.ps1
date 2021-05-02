$baseUri = "https://www.seek.com.au"
$varUri = "/devops-engineer-jobs/in-All-Melbourne-VIC"
$fullUri = $baseUri + $varUri
Write-Host $fullUri


# -UseBasicParsing hides the cookies prompt but cannot use the ParsedHtml property
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12 
$r = Invoke-WebRequest -Uri $fullUri -UseBasicParsing

# Writing raw content into 
$HTML = New-Object -ComObject "HTMLFile"
$HTML.IHTMLDocument2_write($r.RawContent)
$HTML.all.tags("p") | % innerText