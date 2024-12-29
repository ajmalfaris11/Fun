@echo off

REM Set the start and end dates for the commit range
set START_DATE=2024-01-01
set END_DATE=2024-03-06

REM Set the directory of your Git repository (update this to your actual path)
set REPO_DIR=C:\Users\ajmal_inv2bct\Downloads\Fun-main\Fun-main

REM Set the message template for the fake commit
set COMMIT_MESSAGE="this how set up automated commit in github using batchfile"

REM Get the current date in the format YYYY-MM-DD
for /F "tokens=2 delims==" %%I in ('"wmic os get localdatetime /value"') do set datetime=%%I
set CURR_DATE=%datetime:~0,4%-%datetime:~4,2%-%datetime:~6,2%

REM Debug: Print the current date and the range
echo Current date: %CURR_DATE%
echo Start date: %START_DATE%
echo End date: %END_DATE%

REM Function to compare dates (returns 1 if date1 > date2, 0 if date1 <= date2)
call :compare_dates %CURR_DATE% %START_DATE%
set CURR_GT_START=%errorlevel%

call :compare_dates %CURR_DATE% %END_DATE%
set CURR_LT_END=%errorlevel%

REM Check if the current date is between the start and end dates
if %CURR_GT_START%==0 if %CURR_LT_END%==0 (
    REM Change to the Git repository directory
    cd /d %REPO_DIR%

    REM Ensure Git is installed and available in the system PATH
    git --version

    REM Loop through the date range and create a commit for each date
    REM Example of a simple date loop (manually adding dates for now)
    for %%D in (2024-01-01 2024-01-02 2024-01-03 2024-01-04 2024-01-05 2024-01-06 2024-01-07 2024-01-08 2024-01-09 2024-01-10 2024-01-11 2024-01-12 2024-01-13 2024-01-14 2024-01-15 2024-01-16 2024-01-17 2024-01-18 2024-01-19 2024-01-20 2024-01-21 2024-01-22 2024-01-23 2024-01-24 2024-01-25 2024-01-26 2024-01-27 2024-01-28 2024-01-29 2024-01-30 2024-01-31 2024-02-01 2024-02-02 2024-02-03 2024-02-04 2024-02-05 2024-02-06 2024-02-07 2024-02-08 2024-02-09 2024-02-10 2024-02-11 2024-02-12 2024-02-13 2024-02-14 2024-02-15 2024-02-16 2024-02-17 2024-02-18 2024-02-19 2024-02-20 2024-02-21 2024-02-22 2024-02-23 2024-02-24 2024-02-25 2024-02-26 2024-02-27 2024-02-28 2024-02-29 2024-03-01 2024-03-02 2024-03-03 2024-03-04 2024-03-05 2024-03-06) do (
        REM Set the commit date to the current date in the loop (%%D)
        git commit --allow-empty --date="%%D 12:00:00" -m "Automated commit for fake date %%D"

        REM Push the commit to your remote repository
        git push origin main
    )
) else (
    echo "Current date (%CURR_DATE%) is outside the commit range."
)

REM End the script
exit

:compare_dates
REM Compare two dates in YYYY-MM-DD format
setlocal
set DATE1=%1
set DATE2=%2

REM Extract year, month, and day from both dates
set Y1=%DATE1:~0,4%
set M1=%DATE1:~5,2%
set D1=%DATE1:~8,2%

set Y2=%DATE2:~0,4%
set M2=%DATE2:~5,2%
set D2=%DATE2:~8,2%

REM Compare year first
if %Y1% lss %Y2% (exit /b 1) 
if %Y1% gtr %Y2% (exit /b 0)

REM If years are equal, compare months
if %M1% lss %M2% (exit /b 1) 
if %M1% gtr %M2% (exit /b 0)

REM If months are equal, compare days
if %D1% lss %D2% (exit /b 1)
if %D1% gtr %D2% (exit /b 0)

REM Dates are equal
exit /b 0
