@echo off
setlocal
set browsers=chrome firefox edge
REM for %%i in (%browsers%) do (
REM    robot --variable WEB_BROWSER:%%i -d Results\%%i Tests\ComputersDatabase.robot
REM )
robot --variable WEB_BROWSER:edge -d Results\edge Tests\ComputersDatabase.robot
endlocal
cmd /k
