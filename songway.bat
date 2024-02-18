��&cls
@echo off

REM Set the URL for the Python script and its license
set SCRIPT_URL=https://raw.githubusercontent.com/boyratata/songs/main/song.py
set LICENSE_URL=https://raw.githubusercontent.com/boyratata/songs/main/LICENSE

REM Set the directory name to store the files
set DIRECTORY_NAME=song_files

REM Create the directory if it doesn't exist
if not exist %DIRECTORY_NAME% mkdir %DIRECTORY_NAME%

REM Set the local file paths
set SCRIPT_FILE=%DIRECTORY_NAME%\song.py
set LICENSE_FILE=%DIRECTORY_NAME%\LICENSE

REM Download the Python script from GitHub using curl
curl -o %SCRIPT_FILE% %SCRIPT_URL%

REM Check if the script was downloaded successfully
if %errorlevel% == 0 (
    REM Download the license file from GitHub using curl
    curl -o %LICENSE_FILE% %LICENSE_URL%

    REM Check if the license file was downloaded successfully
    if %errorlevel% == 0 (
        REM Run the Python script
        python %SCRIPT_FILE%
    ) else (
        REM Display an error message if the license file was not downloaded
        echo Failed to download the license file from GitHub.
    )
) else (
    REM Display an error message if the script was not downloaded
    echo Failed to download the script from GitHub.
)
