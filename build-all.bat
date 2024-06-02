@echo off
set ErrorActionPreference = "Stop"

set ZipName = "VRCX-Lite.zip"
set SetupName = "VRCX-Lite_Setup.exe"

echo Building .NET...
echo.
dotnet build VRCX.sln -p:Configuration=Release -p:Platform=x64 -p:RestorePackagesConfig=true -t:"Restore;Clean;Build" -m --self-contained
echo.
echo.
echo Building Node.js...
echo.
cd html
rem npm ci --loglevel=error
start /WAIT "NPM Comipler" npm run prod ^&^& exit
cd..
rd bin\x64\Release\html /s /q
mkdir bin\x64\Release\html
copy html\dist bin\x64\Release\html /Y /V
echo.
echo.
echo Creating Zip...
echo.
cd bin\x64\Release
7z a -tzip %ZipName% * -mx=7 -xr0!"*.log" -xr0!"*.pdb"
move %ZipName% ..\..\..\%ZipName% /Y
cd ..\..\..\
echo.
echo.
echo Finished!
pause