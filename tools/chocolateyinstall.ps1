$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/buddhi1980/mandelbulber2/releases/download/2.26/Mandelbulber2-v2.26.0.0-Setup.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url
  url64bit      = $url64
  softwareName  = 'Mandelbulber2*'
  checksum      = '5E12CDB09B55610003B6D0B2754630197DC7F1403A8D0FD332DD7028978F3342'
  checksumType  = 'sha256' 
  silentArgs    = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`"" # ALLUSERS=1 DISABLEDESKTOPSHORTCUT=1 ADDDESKTOPICON=0 ADDSTARTMENU=0
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs # https://docs.chocolatey.org/en-us/create/functions/install-chocolateypackage