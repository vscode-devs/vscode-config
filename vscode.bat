@echo off
chcp 65001 > nul
title VSCode Settings Manager

:menu
cls
echo -------------------------------
echo    VSCode Settings Manager
echo -------------------------------
echo 1. Backup VSCode Settings
echo 2. Restore VSCode Settings
echo 3. Uninstall VSCode (User Mode)
echo 4. Clean Residual Files
echo 5. Download and Install VSCode
echo 6. Exit
echo -------------------------------
set /p choice=Please select an option (enter number): 

if "%choice%"=="1" goto backup
if "%choice%"=="2" goto restore
if "%choice%"=="3" goto uninstall
if "%choice%"=="4" goto clean
if "%choice%"=="5" goto download_install
if "%choice%"=="6" exit /b
echo Invalid selection, please try again
timeout /t 2 > nul
goto menu

:: Backup settings to local
:backup
set "vscode_settings=%APPDATA%\Code\User\settings.json"
set "backup_dir=%~dp0settings"
set "backup_file=%backup_dir%\user-settings.json"

if not exist "%vscode_settings%" (
    echo Error: VSCode settings file not found
    echo Possible reasons: VSCode not installed or never modified settings
    pause
    goto menu
)

if not exist "%backup_dir%" (
    mkdir "%backup_dir%"
    echo Backup directory created: %backup_dir%
)

copy /Y "%vscode_settings%" "%backup_file%" > nul
echo Backup successful!
echo [Source]  %vscode_settings%
echo [Target]  %backup_file%
pause
goto menu

:: Restore settings from backup
:restore
set "vscode_settings=%APPDATA%\Code\User\settings.json"
set "backup_file=%~dp0settings\user-settings.json"

if not exist "%backup_file%" (
    echo Error: Backup file not found
    echo Please backup first or check file path
    pause
    goto menu
)

copy /Y "%backup_file%" "%vscode_settings%" > nul
echo Restore successful!
echo [Source]  %backup_file%
echo [Target]  %vscode_settings%
pause
goto menu

:: Uninstall VSCode (User Mode)
:uninstall
setlocal EnableDelayedExpansion

set "paths[0]=%LOCALAPPDATA%\Programs\Microsoft VS Code"
set "paths[1]=%USERPROFILE%\AppData\Local\Programs\Microsoft VS Code"
set "paths[2]=%ProgramFiles%\Microsoft VS Code"

echo Scanning for VSCode installations...
echo ------------------------------------

set found=0
for /l %%i in (0,1,2) do (
    set "install_dir=!paths[%%i]!"
    if exist "!install_dir!\unins000.exe" (
        echo Found installation at: !install_dir!
        set /a found+=1
        set "uninstaller=!install_dir!\unins000.exe"
        goto :start_uninstall
    )
)

if %found% equ 0 (
    echo Could not find automatic installation
    echo Please input VSCode installation path:
    set /p custom_path=Enter path (e.g. C:\MyTools\VSCode): 
    if exist "%custom_path%\unins000.exe" (
        set "uninstaller=%custom_path%\unins000.exe"
        goto :start_uninstall
    ) else (
        echo Error: Uninstaller not found in specified path
        echo Check if unins000.exe exists in: %custom_path%
    )
)

:start_uninstall
if defined uninstaller (
    echo Starting uninstaller: %uninstaller%
    echo NOTE: This will start the GUI uninstaller
    echo Close this window ONLY AFTER uninstall completes
    timeout /t 5
    start /wait "" "%uninstaller%"
) else (
    echo Error: No valid uninstaller found
    echo Possible solutions:
    echo 1. Already uninstalled
    echo 2. Portable/zip version installed
    echo 3. Custom installer used
)
pause
endlocal
goto menu

:: Clean residual files
:clean
echo Cleaning residual files...
echo ---------------------------
echo This will delete:
echo - %USERPROFILE%\.vscode
echo - %APPDATA%\Code
echo ---------------------------

rd /s /q "%USERPROFILE%\.vscode" 2>nul && echo Deleted: %USERPROFILE%\.vscode
rd /s /q "%APPDATA%\Code" 2>nul && echo Deleted: %APPDATA%\Code

echo ---------------------------
echo Cleanup completed
pause
goto menu

:: 新增下载安装功能
:download_install
cls
setlocal enabledelayedexpansion
set "download_url=https://vscode.download.prss.microsoft.com/dbazure/download/stable/848b80aeb52026648a8ff9f7c45a9b0a80641e2e/VSCodeUserSetup-x64-1.100.2.exe"
set "installer_name=VSCodeUserSetup-x64-1.100.2.exe"
set "installer_path=%~dp0%installer_name%"

echo Checking local installer...
echo ---------------------------

:: 修复括号解析问题
if exist "%installer_path%" (
    echo Found existing installer: 
    echo [Path] %installer_path%
    
    for %%F in ("%installer_path%") do set "exist_size=%%~zF"
    set "min_valid_size=50000000"
    
    if !exist_size! LSS !min_valid_size! (
        echo Corrupted file detected ^(!exist_size! bytes^)
        del /f /q "%installer_path%"
        goto download
    )
    
    choice /m "Use existing installer (Y/N)"
    if errorlevel 2 goto download
    goto install
)

:download
echo Downloading Visual Studio Code...
echo ---------------------------------
echo URL: %download_url%
echo Path: %installer_path%

where curl >nul 2>&1 || (
    echo Error: curl not found in PATH
    echo Download curl from https://curl.se/windows/
    pause
    endlocal
    goto menu
)

curl -L -o "%installer_path%" --progress-bar "%download_url%"
if errorlevel 1 (
    echo Download failed with error code %errorlevel%
    if exist "%installer_path%" del /f /q "%installer_path%"
    pause
    endlocal
    goto menu
)

:install
echo Validating installer...
for %%F in ("%installer_path%") do set "final_size=%%~zF"
if !final_size! LSS 50000000 (
    echo Invalid file size: !final_size! bytes
    del /f /q "%installer_path%"
    pause
    endlocal
    goto menu
)

echo Starting installation...
echo -----------------------
start "" "%installer_path%" /VERYSILENT /NORESTART

echo Installer launched successfully
echo You can close this window after setup completes
endlocal
pause
goto menu

