# Read the input file name from the command line argument, or use "input.txt" as the default
$inputFile = "input.txt"
if ($args.Length -gt 0) {
  $inputFile = $args[0]
} else {
  Write-Host "No input file specified. Using default input file: input.txt"
}

# Read the input data from the input file
$inputData = Get-Content $inputFile

# Initialize variables to store the relevant data
$names = @()
$interfaces = @()
$staticRoutes = @()
$routingProtocols = @()
$vpns = @()
$accessControlPolicies = @()
$qosPolicies = @()

# Iterate through each line of the input data
foreach ($inputLine in $inputData) {
  # Check if the line starts with any of the keywords we are interested in
  if ($inputLine.StartsWith("name") -or
      $inputLine.StartsWith("interface") -or
      $inputLine.StartsWith("ip route") -or
      $inputLine.StartsWith("router") -or
      $inputLine.StartsWith("crypto") -or
      $inputLine.StartsWith("access-list") -or
      ($inputLine.StartsWith("class-map") -or $inputLine.StartsWith("policy-map"))) {
    # If the line starts with one of the keywords, add it to the appropriate array
    if ($inputLine.StartsWith("name")) {
      $names += $inputLine
    } elseif ($inputLine.StartsWith("interface")) {
      $interfaces += $inputLine
    } elseif ($inputLine.StartsWith("ip route")) {
      $staticRoutes += $inputLine
    } elseif ($inputLine.StartsWith("router")) {
      $routingProtocols += $inputLine
    } elseif ($inputLine.StartsWith("crypto")) {
      $vpns += $inputLine
    } elseif ($inputLine.StartsWith("access-list")) {
      $accessControlPolicies += $inputLine
    } elseif ($inputLine.StartsWith("class-map") -or $inputLine.StartsWith("policy-map")) {
      $qosPolicies += $inputLine
    }
  }
}

# Generate the report
$report = "Names:`n$($names -join "`n")`n`nInterfaces:`n$($interfaces -join "`n")`n`nStatic Routes:`n$($staticRoutes -join "`n")`n`nRouting Protocols:`n$($routingProtocols -join "`n")`n`nVPNs:`n$($vpns -join "`n")`n`nAccess Control Policies:`n$($accessControlPolicies -join "`n")`n`nQoS Policies:`n$($qosPolicies -join "`n")"

# Save the report to a file
$report | Out-File "$(get-date -f dd-MM-yyyy)_report.txt"


