@echo off
chcp 65001 > nul
title VSCode Settings Manager

:: 菜单
:: -------------------------------------------------
:menu
cls
echo -------------------------------
echo    VSCode Settings Manager
echo -------------------------------
echo 1. Backup VSCode Settings and extensions
echo 2. Restore VSCode Settings
echo 3. Uninstall VSCode (User Mode)
echo 4. Clean Residual Files
echo 5. Download and Install VSCode
echo 6. Generate Extension Manifest
echo 7. Download VSCode Server
echo 9. Exit
echo -------------------------------
set /p choice=Please select an option (enter number): 

if "%choice%"=="1" goto backup
if "%choice%"=="2" goto restore
if "%choice%"=="3" goto uninstall
if "%choice%"=="4" goto clean
if "%choice%"=="5" goto install_menu
if "%choice%"=="6" goto generate_manifest
if "%choice%"=="7" goto download_server
if "%choice%"=="9" exit /b
echo Invalid selection, please try again
timeout /t 2 > nul
goto menu

:: 1. Backup settings to local
:: -------------------------------------------------
:backup
set "backup_dir=%~dp0settings"
set "user_settings=%APPDATA%\Code\User\settings.json"
set "extensions_list=%USERPROFILE%\.vscode\extensions\extensions.json"

echo Starting backup...
echo -------------------

:: 创建备份目录
if not exist "%backup_dir%" (
    mkdir "%backup_dir%"
    echo Created backup directory: %backup_dir%
)

:: 备份用户设置
if exist "%user_settings%" (
    copy /Y "%user_settings%" "%backup_dir%\user-settings.json" >nul
    echo [Success] Settings backed up to:
    echo   %backup_dir%\user-settings.json
) else (
    echo [Warning] Settings file not found:
    echo   %user_settings%
)

:: 备份扩展列表
if exist "%extensions_list%" (
    copy /Y "%extensions_list%" "%backup_dir%\user-extensions.json" >nul
    echo [Success] Extensions list backed up to:
    echo   %backup_dir%\user-extensions.json
) else (
    echo [Warning] Extensions file not found:
    echo   %extensions_list%
)

echo Backup completed
pause
goto menu

:: 2. Restore settings from backup
:: -------------------------------------------------
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

:: 3. Uninstall VSCode (User Mode)
:: -------------------------------------------------
:uninstall
setlocal EnableDelayedExpansion

set "paths[0]=%LOCALAPPDATA%\Programs\Microsoft VS Code"
set "paths[1]=%USERPROFILE%\AppData\Local\Programs\Microsoft VS Code"
set "paths[2]=%ProgramFiles%\Microsoft VS Code"
:: 定义常见安装路径列表
set "paths[0]=%LOCALAPPDATA%\Programs\Microsoft VS Code"  :: 用户安装
set "paths[1]=%ProgramFiles%\Microsoft VS Code"           :: 系统安装
set "paths[2]=%ProgramFiles(x86)%\Microsoft VS Code"      :: 32位系统安装
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
    set /p custom_path=Enter path (e.g. C:\MyTools\VSCode^):
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

:: 4. Clean residual files
:: -------------------------------------------------
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

:: 5. 下载安装vscode
:: -------------------------------------------------
:install_menu
cls
echo -------------------------------
echo    VSCode Installation Type
echo -------------------------------
echo 1. User Install   (Current User, will install to %LOCALAPPDATA%\Programs\Microsoft VS Code)
echo 2. System Install (All Users, will install to %ProgramFiles%\Microsoft VS Code)
echo 3. Return to Main Menu
echo -------------------------------
set /p install_choice=Select installation type: 

if "%install_choice%"=="1" goto download_user
if "%install_choice%"=="2" goto download_system
if "%install_choice%"=="3" goto menu
echo Invalid selection, please try again
timeout /t 2 > nul
goto install_menu


:download_user
set "install_type=user"
set "commit_id=848b80aeb52026648a8ff9f7c45a9b0a80641e2e"
set "url_param=VSCodeUserSetup-x64-1.100.2.exe"
set "installer_name=VSCodeUserSetup-x64-1.100.2.exe"
set "install_path=%LOCALAPPDATA%\Programs\Microsoft VS Code"
goto download

:download_system
set "install_type=system"
set "commit_id=848b80aeb52026648a8ff9f7c45a9b0a80641e2e"
set "url_param=VSCodeSetup-x64-1.100.2.exe"
set "installer_name=VSCodeSetup-x64-1.100.2.exe"
set "install_path=%ProgramFiles%\Microsoft VS Code"

:: 检查管理员权限
::net session >nul 2>&1
::if %errorLevel% neq 0 (
::    echo Requesting administrator privileges...
::    timeout /t 2
::    powershell -Command "Start-Process cmd -ArgumentList '/c %~s0' -Verb RunAs"
::    exit /b
::)

:download
setlocal enabledelayedexpansion
set "installer_path=%~dp0%installer_name%"
:: https://vscode.download.prss.microsoft.com/dbazure/download/stable/848b80aeb52026648a8ff9f7c45a9b0a80641e2e/VSCodeUserSetup-x64-1.100.2.exe
set "download_url=https://vscode.download.prss.microsoft.com/dbazure/download/stable/%commit_id%/%url_param%"

echo Checking local installer...
echo ---------------------------

if exist "%installer_path%" (
    echo Found existing installer: 
    echo [Path] %installer_path%
    
    for %%F in ("%installer_path%") do set "exist_size=%%~zF"
    set "min_valid_size=50000000"
    
    if !exist_size! LSS !min_valid_size! (
        echo Corrupted file detected ^(!exist_size! bytes^)
        del /f /q "%installer_path%"
        goto download_start
    )
    
    choice /m "Use existing installer (Y/N)"
    if errorlevel 2 goto download_start
    goto install
)

:download_start
echo Downloading Visual Studio Code (%install_type% install %download_url%)...
echo --------------------------------------------------------
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

echo Starting %install_type% installation...
echo -------------------------------------
echo installing...
:: 仅User模式创建快捷方式,system模式下上面有了 /MERGETASKS=desktopicon 参数后可以自动创建

start /wait "" "%installer_path%" /VERYSILENT /NORESTART /MERGETASKS=desktopicon
if errorlevel 1 (
	echo Installation failed with error code %errorlevel%
	pause
	endlocal
	goto menu
)


:: 等待2秒确保安装完成
timeout /t 2 /nobreak >nul

:: 验证安装路径
set "vscode_exe=%install_path%\Code.exe"
echo Verifying installation at: "%vscode_exe%"
if not exist "%vscode_exe%" (
    echo Error: VSCode executable not found after installation
    echo Possible reasons:
    echo 1. Installation was interrupted
    echo 2. Custom installation path used
    echo 3. Antivirus blocked the installation
    pause
    endlocal
    goto menu
)

if "%install_type%"=="user" (
    echo Creating desktop shortcut...
    echo ---------------------------
	powershell -Command "$installPath='%install_path:\=\\%'; $desktop=[Environment]::GetFolderPath('Desktop'); $shortcutPath=Join-Path $desktop 'Visual Studio Code.lnk'; $ws=New-Object -ComObject WScript.Shell; $sc=$ws.CreateShortcut($shortcutPath); $sc.TargetPath=($installPath+'\Code.exe'); $sc.WorkingDirectory=$installPath; $sc.IconLocation=$sc.TargetPath+',0'; $sc.Save()"

	:: 验证结果
	if exist "%USERPROFILE%\Desktop\Visual Studio Code.lnk" (
		echo Shortcut created successfully at:
		echo "%USERPROFILE%\Desktop\Visual Studio Code.lnk"
	) else (
		echo Failed to create shortcut
	)
)

:: echo Cleaning up installer...
:: del /f /q "%installer_path%"

echo Installation completed!
pause
endlocal
goto menu

:: 6. 从json文件创建yaml文件
:: -------------------------------------------------
:generate_manifest
setlocal
echo Generating extension manifest...
echo -------------------------------

set "file_map[0].input=%~dp0settings\user-extensions.json"
set "file_map[0].output=%~dp0settings\user-extensions.yaml"
set "file_map[1].input=%~dp0settings\ssh-remote-extensions.json"
set "file_map[1].output=%~dp0settings\ssh-remote-extensions.yaml"

if not exist "%file_map[0].input%" (
    echo Error: Extensions file not found
    echo Run Backup first to create user-extensions.json
    pause
    endlocal
    goto menu
)
echo file_map[0].input=%file_map[0].input%
powershell -Command "$json=Get-Content -LiteralPath '%file_map[0].input%' -Raw | ConvertFrom-Json; $output=@(); foreach($ext in $json){ $id=$ext.identifier.id; $ver=$ext.version; $parts=$id -split '\.'; $publisher=$parts[0]; $name=$parts[1..($parts.Count-1)] -join '.'; $vsixUrl='https://marketplace.visualstudio.com/_apis/public/gallery/publishers/'+$publisher.ToLower()+'/vsextensions/'+$name.ToLower()+'/'+$ver+'/vspackage'; $output+='' + $name + ':'; $output+='  publisher: ' + $publisher; $output+='  extension: ' + $name; $output+='  version: ' + $ver; $output+='  vsix-url: ' + $vsixUrl; $output+=''; } $output | Out-File -LiteralPath '%file_map[0].output%' -Encoding UTF8;"

if exist "%file_map[0].output%" (
    echo Manifest generated successfully:
    echo   %file_map[0].output%
    type "%file_map[0].output%"
) else (
    echo Failed to generate manifest
)

if not exist "%file_map[1].input%" (
    echo Error: Extensions file not found
    echo Run Backup first to create user-extensions.json
    pause
    endlocal
    goto menu
)
echo file_map[1].input=%file_map[1].input%
powershell -Command "$json=Get-Content -LiteralPath '%file_map[1].input%' -Raw | ConvertFrom-Json; $output=@(); foreach($ext in $json){ $id=$ext.identifier.id; $ver=$ext.version; $parts=$id -split '\.'; $publisher=$parts[0]; $name=$parts[1..($parts.Count-1)] -join '.'; $vsixUrl='https://marketplace.visualstudio.com/_apis/public/gallery/publishers/'+$publisher.ToLower()+'/vsextensions/'+$name.ToLower()+'/'+$ver+'/vspackage'; $output+='' + $name + ':'; $output+='  publisher: ' + $publisher; $output+='  extension: ' + $name; $output+='  version: ' + $ver; $output+='  vsix-url: ' + $vsixUrl; $output+=''; } $output | Out-File -LiteralPath '%file_map[1].output%' -Encoding UTF8;"

if exist "%file_map[1].output%" (
    echo Manifest generated successfully:
    echo   %file_map[1].output%
    type "%file_map[1].output%"
) else (
    echo Failed to generate manifest
)

pause
endlocal
goto menu

:: 7. 下载vscode server
:: -------------------------------------------------
:download_server
setlocal enabledelayedexpansion
echo Checking VSCode installation...
echo ------------------------------

:: 定义安全路径数组（使用延迟扩展）
set "paths[0]=%LOCALAPPDATA%\Programs\Microsoft VS Code"
set "paths[1]=%ProgramFiles%\Microsoft VS Code"
set "paths[2]=%ProgramFiles(x86)%\Microsoft VS Code"
set "paths[3]=%USERPROFILE%\AppData\Local\Programs\Microsoft VS Code"
set "paths[4]=C:\Programs\VSCode"

:: 安全遍历路径数组
set found=0
for %%i in (0 1 2 3 4) do (
    set "install_dir=!paths[%%i]!"
    set "product_json=!install_dir!\resources\app\product.json"
    
    echo Checking: "!install_dir!"
    if exist "!product_json!" (
        echo Found valid installation at:
        echo   "!install_dir!"
        set /a found+=1
        goto :extract_info
    )
)

:: 新增自定义路径处理
if !found! equ 0 (
    echo Enter custom installation path:
    set /p "custom_path=Example: C:\MyVSCode : "
    set "product_json=!custom_path!\resources\app\product.json"
    if exist "!product_json!" (
        set "install_dir=!custom_path!"
        set /a found+=1
        goto :extract_info
    ) else (
        echo Error: Missing product.json
        echo Expected path: "!product_json!"
        pause
        endlocal
        goto menu
    )
)

:extract_info
:: 使用改进的PowerShell解析命令
set "ps_cmd=Get-Content -LiteralPath '!product_json!' -Raw | ConvertFrom-Json | ForEach-Object { $_.version + '|' + $_.commit }"
for /f "tokens=1,2 delims=|" %%a in ('powershell -Command "!ps_cmd!"') do (
    set "version=%%a"
    set "commit_id=%%b"
)

:: 清理版本号（更安全的处理方式）
set "version=!version: =!"
set "version=!version:"=!"
if "!version:~-1!"=="," set "version=!version:~0,-1!"

:: 验证输出
echo Current Version: !version!
echo Commit ID      : !commit_id!

:: 创建下载目录
set "download_dir=%~dp0vscode-server"
if not exist "!download_dir!" mkdir "!download_dir!"

:: 版本比较逻辑（使用PowerShell）
echo Base Version   : 1.86.2
::set "version=1.66.0"
:: 调用比较函数
call :CompareVersion "%version%" "1.86.2"
set compare_ret=!errorlevel!
if !compare_ret! equ 0 (
    echo CompareVersion : [%version%^<=1.86.2]
    set "url=https://update.code.visualstudio.com/commit:!commit_id!/server-linux-x64/stable"
    set "filename=vscode-server-linux-x64-old-!commit_id!.tar.gz"
    ::echo   Downloading !filename! from !url!
    call :DownloadPackage "!url!" "!filename!" "!download_dir!"
) else (
    echo CompareVersion : [%version%^>1.86.2]
    set "url=https://vscode.download.prss.microsoft.com/dbazure/download/stable/!commit_id!/vscode-server-linux-x64.tar.gz"
    set "filename=vscode-server-linux-x64-!commit_id!.tar.gz"
    ::echo   Downloading !filename! from !url!
    call :DownloadPackage "!url!" "!filename!" "!download_dir!"

    set "url=https://vscode.download.prss.microsoft.com/dbazure/download/stable/!commit_id!/vscode_cli_alpine_x64_cli.tar.gz"
    set "filename=vscode-cli-alpine-x64-!commit_id!.tar.gz"
    ::echo   Downloading !filename! from !url!
    call :DownloadPackage "!url!" "!filename!" "!download_dir!"
)

echo Download completed!
echo Files saved to: "!download_dir!"
dir /b "!download_dir!"

:: 生成安装脚本
setlocal enabledelayedexpansion
set "template_dir=%~dp0template"
set "output_dir=%~dp0vscode-server"
set "commit_id=%commit_id%"

echo ----------- Generating installation script ---------------
:: 验证模板文件存在性
set "old_template=!template_dir!\vscode-server-old.sh"
set "new_template=!template_dir!\vscode-server-new.sh"

if not exist "!old_template!" (
    echo Error: Old template not found at:
    echo   !old_template!
    pause
    goto menu
)
if not exist "!new_template!" (
    echo Error: New template not found at:
    echo   !new_template!
    pause
    goto menu
)

:: 创建输出目录
if not exist "!output_dir!" (
    mkdir "!output_dir!"
    echo Created output directory: !output_dir!
)

:: 根据版本选择模板
set "selected_template="
if !compare_ret! equ 0 (
    set "selected_template=!old_template!"
    echo Using OLD template format
) else (
    set "selected_template=!new_template!"
    echo Using NEW template format
)

:: 生成目标文件
set "output_file=!output_dir!\install-vscode-server.sh"
:: 文件生成逻辑
powershell -Command ^
    "$commit = '%commit_id%';" ^
    "$templatePath = '!selected_template!';" ^
    "$outputPath = '!output_file!';" ^
    "$utf8 = New-Object System.Text.UTF8Encoding $false;" ^
    "$content = [System.IO.File]::ReadAllText($templatePath, $utf8);" ^
    "$content = $content.Replace('${commit_id}', $commit) -replace \"`r\",'';" ^
    "[System.IO.File]::WriteAllText($outputPath, $content, $utf8);" ^
    "if ([System.IO.File]::ReadAllBytes($outputPath)[0] -eq 0xEF) { exit 1 }"
    
if errorlevel 1 (
    echo ERROR: BOM检测失败,请检查模板文件编码
    pause
    goto menu
)

pause
endlocal
goto menu

: 封装的下载函数
:: 参数：%1=下载URL, %2=文件名, %3=保存目录
:DownloadPackage
setlocal enabledelayedexpansion
set "_url=%~1"
set "_file=%~2"
set "_dir=%~3"
set "_path="%_dir%\%_file%""

echo ----------- DownloadPackage ---------------
echo Checking package: "%_file%"
echo From: "%_url%"

if exist !_path! (
    echo [Info] Package exists, skip download
) else (
    echo Downloading new package...
    curl -L -o !_path! --create-dirs --progress-bar "!_url!"
    if !errorlevel! neq 0 (
        echo [ERROR] Download failed for "!_file!"
        exit /b 1
    )
    echo [Success] Downloaded: "!_file!"
)
endlocal
exit /b 0

:: 版本比较函数
:: 参数1: 当前版本
:: 参数2: 基准版本
:: 返回: errorlevel 0(<=基准版本) 或 1(>基准版本)
:CompareVersion
setlocal
set "current=%~1"
set "base=%~2"

:: 清理版本号（移除非数字和点的字符）
set "current=!current:.= !"
set "base=!base:.= !"

:: 拆分版本号为三个部分
for /f "tokens=1-3" %%a in ("!current!") do (
    set /a cur_major=%%a
    set /a cur_minor=%%b
    set /a cur_build=%%c
)

for /f "tokens=1-3" %%a in ("!base!") do (
    set /a base_major=%%a
    set /a base_minor=%%b
    set /a base_build=%%c
)

:: 比较逻辑
if !cur_major! gtr !base_major! ( exit /b 1 )
if !cur_major! lss !base_major! ( exit /b 0 )

if !cur_minor! gtr !base_minor! ( exit /b 1 )
if !cur_minor! lss !base_minor! ( exit /b 0 )

if !cur_build! gtr !base_build! ( exit /b 1 )

exit /b 0

:EOF
endlocal
