@echo off
setlocal enabledelayedexpansion

REM Define commit dates and messages
set "dates=2024-01-01 09:15:00,2024-01-02 12:30:00,2024-01-03 14:00:00,2024-01-04 10:00:00,2024-01-05 11:45:00,2024-01-06 13:00:00,2024-01-07 16:30:00,2024-01-08 10:20:00,2024-01-09 14:00:00,2024-01-10 15:30:00,2024-01-11 09:45:00,2024-01-12 13:05:00,2024-01-13 11:20:00,2024-01-14 15:00:00,2024-01-15 17:10:00,2024-01-16 08:30:00,2024-01-17 14:00:00,2024-01-18 08:45:00,2024-01-19 16:20:00,2024-01-20 19:00:00,2024-01-21 10:30:00,2024-01-22 11:00:00,2024-01-23 14:30:00,2024-01-24 13:45:00,2024-01-25 16:00:00,2024-01-26 15:30:00,2024-01-27 10:00:00,2024-01-28 11:20:00,2024-01-29 09:50:00,2024-01-30 10:20:00"
set "messages=Updated README,Fixed bug in login validation,Added new feature for user profiles,Refactored code for better readability,Updated UI for homepage,Optimized database queries,Fixed issue with password reset,Improved performance of search,Added unit tests,Merged pull requests,Updated third-party libraries,Fixed UI bug,Added multi-language support,Improved error handling,Final review,Preparation for release"

REM Initialize the index for processing
set /a "index=0"

REM Loop to commit each date-message pair
for %%d in (%dates%) do (
    REM Get the current commit date
    for %%m in (%messages%) do (
        REM Commit with the specific date and message
        git add .
        git commit --date="%%d" -m "%%m"
        echo Committed with message: %%m at %%d

        REM Increase the index for the next pair of date/message
        set /a "index+=1"

        REM Optional: Delay between commits (e.g., 1 second)
        timeout /t 1 > nul
    )
)

echo All commits are done.
pause
