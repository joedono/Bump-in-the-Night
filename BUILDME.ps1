$Version = Read-Host -Prompt 'Version Number?'
$path = cd
$exclude = @("notes", "wip", "BUILDME.ps1", "README.md", "RUNME.bat")
$files = Get-ChildItem -Path $path -Exclude $exclude

Compress-Archive -Path $files -DestinationPath "Bump-in-the-Night_${Version}.zip"
Rename-Item -Path "Bump-in-the-Night_${Version}.zip" -NewName "Bump-in-the-Night_${Version}.love"

cmd.exe /c copy /b "E:\Program Files\LOVE\love.exe"+"Bump-in-the-Night_$Version.love" "Bump-in-the-Night.exe"
Rename-Item -Path "Bump-in-the-Night.exe" -NewName "Bump-in-the-Night_${Version}_Win_x64.exe"
Compress-Archive -Path "E:\Program Files\LOVE\*.dll", "Bump-in-the-Night_${Version}_Win_x64.exe" -DestinationPath "Bump-in-the-Night_${Version}_Win_x64.zip"
Remove-Item -Path "Bump-in-the-Night_${Version}_Win_x64.exe"

cmd.exe /c copy /b "E:\Program Files (x86)\LOVE\love.exe"+"Bump-in-the-Night_$Version.love" "Bump-in-the-Night.exe"
Rename-Item -Path "Bump-in-the-Night.exe" -NewName "Bump-in-the-Night_${Version}_Win_x86.exe"
Compress-Archive -Path "E:\Program Files (x86)\LOVE\*.dll", "Bump-in-the-Night_${Version}_Win_x86.exe" -DestinationPath "Bump-in-the-Night_${Version}_Win_x86.zip"
Remove-Item -Path "Bump-in-the-Night_${Version}_Win_x86.exe"

pause