@echo off
setlocal
REM set browsers=chrome firefox
set browsers=chrome firefox edge
for %%i in (%browsers%) do (
    echo Running %%i tests
    robot --variable WEB_BROWSER:%%i -d Results\%%i Tests\ComputersDatabase.robot
)
endlocal
cmd /k
