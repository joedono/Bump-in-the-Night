$Project = 'Bump-in-the-Night'
$Version = Read-Host -Prompt 'Version Number?'
$path = cd
$exclude = @("notes", "wip", "BUILDME.ps1", "README.md", "RUNME.bat")
$files = Get-ChildItem -Path $path -Exclude $exclude

Compress-Archive -Path $files -DestinationPath "${Project}_${Version}.zip"
Rename-Item -Path "${Project}_${Version}.zip" -NewName "${Project}_${Version}.love"

cmd.exe /c copy /b "E:\Program Files\LOVE\love.exe"+"${Project}_$Version.love" "${Project}.exe"
Rename-Item -Path "${Project}.exe" -NewName "${Project}_${Version}_Win_x64.exe"
Compress-Archive -Path "E:\Program Files\LOVE\*.dll", "${Project}_${Version}_Win_x64.exe" -DestinationPath "${Project}_${Version}_Win_x64.zip"
Remove-Item -Path "${Project}_${Version}_Win_x64.exe"

cmd.exe /c copy /b "E:\Program Files (x86)\LOVE\love.exe"+"${Project}_$Version.love" "${Project}.exe"
Rename-Item -Path "${Project}.exe" -NewName "${Project}_${Version}_Win_x86.exe"
Compress-Archive -Path "E:\Program Files (x86)\LOVE\*.dll", "${Project}_${Version}_Win_x86.exe" -DestinationPath "${Project}_${Version}_Win_x86.zip"
Remove-Item -Path "${Project}_${Version}_Win_x86.exe"

pause