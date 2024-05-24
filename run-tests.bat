@echo off
setlocal
set browsers=chrome firefox
REM set browsers=chrome firefox edge
for %%i in (%browsers%) do (
    echo Running %%i tests
    robot --variable WEB_BROWSER:%%i -d Results\%%i Tests\ComputersDatabase.robot
)
endlocal
cmd /k
