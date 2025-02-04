## Windows Batch Example

```batch_file
@echo off
setlocal EnableDelayedExpansion

:: This is a comment
REM This is another way to comment

echo ====================================
echo Windows Batch File Syntax Demo
echo ====================================

:: Variables and user input
set "name=World"
set /p "userInput=Please enter your name: "
if not "%userInput%"=="" set "name=%userInput%"

:: Basic output and variables
echo.
echo Hello, %name%!
echo Current directory: %CD%
echo Batch file name: %~nx0
echo Full path: %~f0

:: Environment variables
echo.
echo System Drive: %SystemDrive%
echo Program Files: %ProgramFiles%
echo User Profile: %USERPROFILE%

:: Arithmetic operations
set /a num1=5
set /a num2=3
set /a sum=%num1%+%num2%
set /a product=%num1%*%num2%
echo.
echo Basic Math:
echo %num1% + %num2% = %sum%
echo %num1% * %num2% = %product%

:: Conditional statements
echo.
echo Conditional Examples:
if %num1% GTR %num2% (
    echo %num1% is greater than %num2%
) else (
    echo %num1% is not greater than %num2%
)

:: Loop examples
echo.
echo For Loop Example:
for %%i in (1 2 3 4 5) do (
    echo Number: %%i
)

echo.
echo Directory Loop Example:
for /d %%d in ("%SystemDrive%\*") do (
    echo Found directory: %%d
)

:: Function/Label demonstration
call :MyFunction "Hello from function!"
goto :SkipFunction

:MyFunction
echo.
echo Function Demo:
echo Parameter received: %~1
exit /b

:SkipFunction

:: Error handling
echo.
echo Error Handling Demo:
dir /x nonexistent.file 2>nul
if errorlevel 1 (
    echo File not found error detected
)

:: Delayed expansion example
set "counter=1"
for %%a in (A B C) do (
    set /a "counter+=1"
    echo Counter is: !counter! for %%a
)

:: Choice command
echo.
echo Choice Command Demo:
choice /c YN /m "Do you want to continue"
if errorlevel 2 goto :EndDemo
if errorlevel 1 echo You selected Yes

:: Working with files
echo.
echo File Operations Demo:
echo Creating temporary file...
echo Test content > temp.txt
type temp.txt
del temp.txt

:: Command nesting and piping
echo.
echo Command Nesting Demo:
dir | find "DIR" > nul && echo Directories found

:: Random number generation
set /a "random_num=%random% %% 100 + 1"
echo.
echo Random number between 1 and 100: %random_num%

:EndDemo
echo.
echo ====================================
echo Demo Complete
echo ====================================

endlocal
pause
```