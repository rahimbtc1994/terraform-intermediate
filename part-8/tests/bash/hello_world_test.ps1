# Enable strict mode
$ErrorActionPreference = "Stop"

# Change directory to example
Set-Location ../../examples/hello-world

# Create the resources
terraform init
terraform apply -auto-approve

# Wait while the instance boots up
Start-Sleep -Seconds 60

# Query the output, extract the IP and make a request
$instanceIp = terraform output -json | ConvertFrom-Json | Select-Object -ExpandProperty instance_ip_addr | Select-Object -ExpandProperty value

if ($instanceIp) {
    Invoke-WebRequest -Uri "http://$instanceIp:8080" -TimeoutSec 10
}

# If request succeeds, destroy the resources
terraform destroy -auto-approve
