@echo off
setlocal
set browsers=edge
REM set browsers=chrome firefox edge
for %%i in (%browsers%) do (
    robot --variable WEB_BROWSER:%%i -d Results\%%i Tests\ComputersDatabase.robot
)
endlocal
cmd /k
