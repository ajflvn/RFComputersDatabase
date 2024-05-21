@echo off
setlocal
set browsers=chrome firefox
for %%i in (%browsers%) do (
    robot --variable WEB_BROWSER:%%i -d Results\%%i Tests\ComputersDatabase.robot
)
endlocal
cmd /k