@echo off
setlocal enabledelayedexpansion

echo Installing luaotb...

:: Get current directory path
set "INSTALL_DIR=%~dp0"
set "INSTALL_DIR=%INSTALL_DIR:~0,-1%"

:: Create directory in Program Files if it doesn't exist
set "TARGET_DIR=C:\Program Files\luaotb"
if not exist "%TARGET_DIR%" mkdir "%TARGET_DIR%"

:: Copy necessary files
copy "%INSTALL_DIR%\luaotb.exe" "%TARGET_DIR%\luaotb.exe" >nul

:: Add to user PATH
for /f "tokens=2*" %%A in ('reg query "HKCU\Environment" /v PATH 2^>nul') do set "USER_PATH=%%B"
if not defined USER_PATH set "USER_PATH="

:: Check if already in PATH
echo !USER_PATH! | find /i "%TARGET_DIR%" >nul
if errorlevel 1 (
    if defined USER_PATH (
        set "NEW_PATH=%USER_PATH%;%TARGET_DIR%"
    ) else (
        set "NEW_PATH=%TARGET_DIR%"
    )
    reg add "HKCU\Environment" /v PATH /t REG_EXPAND_SZ /d "!NEW_PATH!" /f >nul
    echo luaotb installed successfully.
    echo.
    echo To use the 'luaotb' command from any terminal:
    echo 1. Close ALL open terminal windows
    echo 2. Open a new terminal (cmd, PowerShell, etc.)
    echo 3. Or run this command to refresh the current environment:
    echo    set PATH=%%PATH%%;%TARGET_DIR%
) else (
    echo luaotb is already installed.
)

pause