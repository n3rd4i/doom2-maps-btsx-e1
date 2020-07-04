$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
. "$toolsDir\commonEnv.ps1"

& $ENV:COMSPEC /C IF EXIST $wad1_lnk DEL /S /Q $wad1_lnk
& $ENV:COMSPEC /C IF EXIST $wad2_lnk DEL /S /Q $wad2_lnk
