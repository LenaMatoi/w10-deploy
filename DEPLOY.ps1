Write-Output "MATOICORP - IMPREMENTACION DE SISTEMAS"
Start-Sleep 3
Write-output "Estas arrancando esta implementacion en el equipo:"
Start-Sleep 5
hostname
start-sleep 10
Write-Output "Comenzamos a Implementar"
start-sleep 2
write-Output "Instalando Firefox"
$workdir = "c:\installer\"

If (Test-Path -Path $workdir -PathType Container)
{ Write-Host "$workdir already exists" -ForegroundColor Red}
ELSE
{ New-Item -Path $workdir  -ItemType directory }

$source = "https://download.mozilla.org/?product=firefox-latest&os=win64&lang=es-ES"
$destination = "$workdir\firefox.exe"

if (Get-Command 'Invoke-Webrequest')
{
     Invoke-WebRequest $source -OutFile $destination
}
else
{
    $WebClient = New-Object System.Net.WebClient
    $webclient.DownloadFile($source, $destination)
}

Start-Process -FilePath "$workdir\firefox.exe" -ArgumentList "/S"

Start-Sleep -s 35

rm -Force $workdir/firefox*

Write-Output "Ejecutamos Permisos al Powershell";
Start-Sleep -Seconds 5
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope LocalMachine
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope MachinePolicy
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope UserPolicy
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope Process
Write-Output "Esperando para ver permisos";
Start-Sleep -Seconds 5
Write-Output "Comprobando Permisos";
Get-ExecutionPolicy -List
Start-Sleep -Seconds 5
