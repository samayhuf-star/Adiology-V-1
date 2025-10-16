@echo off
REM Upload Files Script for Adiology-V-1 (Windows)
REM This script helps you upload files from your local computer to the repository

echo ===================================
echo Adiology-V-1 File Upload Helper
echo ===================================
echo.

REM Check if we're in a git repository
if not exist ".git" (
    echo Error: Not in a git repository!
    echo Please run this script from the Adiology-V-1 directory.
    pause
    exit /b 1
)

:menu
echo What would you like to do?
echo   1. Upload all files from a directory
echo   2. Upload specific files
echo   3. View status of files to be committed
echo   4. Commit and push files
echo.
set /p choice="Enter your choice (1-4): "

if "%choice%"=="1" goto upload_directory
if "%choice%"=="2" goto upload_files
if "%choice%"=="3" goto view_status
if "%choice%"=="4" goto commit_push
echo Invalid choice
pause
exit /b 1

:upload_directory
echo.
set /p source_dir="Enter the full path to the directory containing your files: "

if not exist "%source_dir%" (
    echo Error: Directory not found: %source_dir%
    pause
    exit /b 1
)

echo.
echo Where should these files go in the repository?
echo   1. docs\    - Documentation files
echo   2. src\     - Source code
echo   3. data\    - Data files
echo   4. images\  - Images
echo   5. scripts\ - Scripts
echo   6. tests\   - Tests
echo   7. Root directory
set /p dest_choice="Enter your choice (1-7): "

if "%dest_choice%"=="1" set dest_dir=docs\
if "%dest_choice%"=="2" set dest_dir=src\
if "%dest_choice%"=="3" set dest_dir=data\
if "%dest_choice%"=="4" set dest_dir=images\
if "%dest_choice%"=="5" set dest_dir=scripts\
if "%dest_choice%"=="6" set dest_dir=tests\
if "%dest_choice%"=="7" set dest_dir=.

echo.
echo Copying files from %source_dir% to %dest_dir%...
xcopy "%source_dir%\*" "%dest_dir%" /E /I /Y
echo Files copied successfully!
goto ask_commit

:upload_files
echo.
set /p files="Enter the full path to the file you want to upload: "

if not exist "%files%" (
    echo Error: File not found: %files%
    pause
    exit /b 1
)

echo.
echo Where should this file go in the repository?
echo   1. docs\    - Documentation files
echo   2. src\     - Source code
echo   3. data\    - Data files
echo   4. images\  - Images
echo   5. scripts\ - Scripts
echo   6. tests\   - Tests
echo   7. Root directory
set /p dest_choice="Enter your choice (1-7): "

if "%dest_choice%"=="1" set dest_dir=docs\
if "%dest_choice%"=="2" set dest_dir=src\
if "%dest_choice%"=="3" set dest_dir=data\
if "%dest_choice%"=="4" set dest_dir=images\
if "%dest_choice%"=="5" set dest_dir=scripts\
if "%dest_choice%"=="6" set dest_dir=tests\
if "%dest_choice%"=="7" set dest_dir=.

echo.
echo Copying file to %dest_dir%...
copy "%files%" "%dest_dir%"
echo File copied successfully!
goto ask_commit

:view_status
echo.
echo Current status:
git status
pause
exit /b 0

:ask_commit
echo.
set /p commit_now="Would you like to commit and push these files now? (y/n): "

if /i "%commit_now%"=="y" goto commit_push_now
if /i "%commit_now%"=="n" goto skip_commit
goto ask_commit

:commit_push_now
echo.
git status
echo.
set /p commit_msg="Enter commit message: "
git add .
git commit -m "%commit_msg%"
echo.
echo Pushing to GitHub...
git push origin main
echo.
echo Files uploaded successfully!
pause
exit /b 0

:commit_push
echo.
git status
echo.
set /p commit_msg="Enter commit message: "
git add .
git commit -m "%commit_msg%"
echo.
echo Pushing to GitHub...
git push origin main
echo.
echo Files uploaded successfully!
pause
exit /b 0

:skip_commit
echo.
echo Files have been copied but not committed.
echo Run 'git status' to see the changes.
echo When ready, run this script again and choose option 4 to commit and push.
pause
exit /b 0
