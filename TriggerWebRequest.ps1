param(
    [Parameter(Manadatory=$true)]
    [string]$ENV,
    [Parameter(Manadatory=$true)]
    $URI
)

$ErrorActionPreference = "Stop"

try{
    .   .\SharedLoggerV11.ps1

$result = Invoke-WebRequest -Uri $URI -Method POST -UseBasicParsing

$statusCode = $result.StatusCode
if ($statusCode -like "2??") {
    logger "Webrequest returned a status code $statusCode." $LOGGING_TYPE_INFO
}
else{
    throw "Webrequest returned a status code $statusCode."
}
}
catch {
    logger ("Line Number Reference: (" +($_.InvocationInfo.ScriptLineNumber) + ") Error: " + $_.Exception.Message)  $LOGGING_TYPE_ERROR
    throw $_.Exception
 
}