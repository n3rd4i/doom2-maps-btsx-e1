$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
. "$toolsDir\commonEnv.ps1"

$url        = 'http://esselfortium.net/wasd/btsx_e1.zip'
$unzipLocation = "$(Join-Path $toolsDir wad)"
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $unzipLocation
  url           = $url
  checksum      = 'EBEE9512F25634A662BB58820A4DA5529EEEFE264A3F6C4F5E9F57A3C1B24CEA'
  checksumType  = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs

# Cleanup link first (safely)
& $ENV:COMSPEC /C IF EXIST $wad1_lnk DEL /S /Q $wad1_lnk
& $ENV:COMSPEC /C IF EXIST $wad2_lnk DEL /S /Q $wad2_lnk

# Install symbolic link for later use
& $ENV:COMSPEC /C MKLINK $wad1_lnk "$(Join-Path $unzipLocation $wad1)"
& $ENV:COMSPEC /C MKLINK $wad2_lnk "$(Join-Path $unzipLocation $wad2)"
