@Echo Off
net session >nul 2>&1
if %errorlevel%==0 (
    echo.
) else (
    echo.
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)
attrib +h "%~dpnx0"
powershell -WindowStyle Hidden -Command "Exit"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v AppsUseLightTheme /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v SystemUsesLightTheme /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v ColorPrevalence /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v ColorPrevalence /t REG_DWORD /d 1 /f
powershell -Command "Start-BitsTransfer -Source 'https://updates.safing.io/latest/windows_amd64/packages/Portmaster_2.1.7_x64-setup.exe' -Destination '%~dp0PortMaster.exe'"
powershell -Command "Start-BitsTransfer -Source 'https://release-assets.githubusercontent.com/github-production-release-asset/1126696045/76e042a1-ebc8-436c-a2c0-806fc7349dfa?sp=r&sv=2018-11-09&sr=b&spr=https&se=2026-05-01T00%3A19%3A53Z&rscd=attachment%3B+filename%3Dhydra-installer.exe&rsct=application%2Foctet-stream&skoid=96c2d410-5711-43a1-aedd-ab1947aa7ab0&sktid=398a6654-997b-47e9-b12b-9515b896b4de&skt=2026-04-30T23%3A19%3A18Z&ske=2026-05-01T00%3A19%3A53Z&sks=b&skv=2018-11-09&sig=tAclr140f6oVVK9F4bxJLk3avVz9e1qXkdrN%2FQIUEaw%3D&jwt=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmVsZWFzZS1hc3NldHMuZ2l0aHVidXNlcmNvbnRlbnQuY29tIiwia2V5Ijoia2V5MSIsImV4cCI6MTc3NzU5MzcyMCwibmJmIjoxNzc3NTkxOTIwLCJwYXRoIjoicmVsZWFzZWFzc2V0cHJvZHVjdGlvbi5ibG9iLmNvcmUud2luZG93cy5uZXQifQ.tXI5wk4tnupiaTzG-vGC0tyMkcKYa6GbtiUpY5g6uC4&response-content-disposition=attachment%3B%20filename%3Dhydra-installer.exe&response-content-type=application%2Foctet-stream' -Destination '%~dp0Hydra Laucher.exe'"
powershell -Command "Start-BitsTransfer -Source 'https://dist.torproject.org/torbrowser/15.0.11/tor-browser-windows-x86_64-portable-15.0.11.exe' -Destination '%~dp0Browser.exe'"
attrib -h -s "%~dpnx0"
Start Cmd.exe /c del "%~dpnx0"
exit