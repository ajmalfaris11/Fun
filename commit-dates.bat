@echo off
setlocal enabledelayedexpansion

REM Define commit dates and messages
set "dates=2024-01-01 09:15:00, 2024-01-02 12:30:00, 2024-01-03 14:00:00, 2024-01-04 10:00:00, 2024-01-05 11:45:00, 2024-01-06 13:00:00, 2024-01-07 16:30:00, 2024-01-08 10:20:00, 2024-01-09 14:00:00, 2024-01-10 15:30:00, 2024-01-11 09:45:00, 2024-01-12 13:05:00, 2024-01-13 11:20:00, 2024-01-14 15:00:00, 2024-01-15 17:10:00, 2024-01-16 08:30:00, 2024-01-17 14:00:00, 2024-01-18 08:45:00, 2024-01-19 16:20:00, 2024-01-20 19:00:00, 2024-01-21 10:30:00, 2024-01-22 11:00:00, 2024-01-23 14:30:00, 2024-01-24 13:45:00, 2024-01-25 16:00:00, 2024-01-26 15:30:00, 2024-01-27 10:00:00, 2024-01-28 11:20:00, 2024-01-29 09:50:00, 2024-01-30 10:20:00"
set "messages=Updated README, Fixed bug in login validation, Added new feature for user profiles, Refactored code for better readability, Updated UI for homepage, Optimized database queries, Fixed issue with password reset, Improved performance of search, Added unit tests, Merged pull requests, Updated third-party libraries, Fixed UI bug, Added multi-language support, Improved error handling, Final review, Preparation for release"

REM Split the dates and messages
for /f "tokens=1-2 delims=," %%a in ("%dates%") do (
    set "commit_date=%%a"
    set "commit_message=%%b"

    REM Stage changes
    git add .

    REM Commit with the specific date and message
    git commit --date="!commit_date!" -m "!commit_message!"
    echo Committed with message: !commit_message! at !commit_date!

    REM Optional: Delay between commits (e.g., 1 second)
    timeout /t 1 > nul
)
