@echo off
setlocal enabledelayedexpansion

REM Path to the commit messages file
set COMMIT_MESSAGES_FILE=commit-messages.txt

REM Read the commit messages file line by line
for /f "tokens=*" %%A in (%COMMIT_MESSAGES_FILE%) do (
    REM Extract the commit message and date
    for /f "tokens=1,* delims= " %%B in ("%%A") do (
        set "MESSAGE=%%B"
        set "DATE_FORMAT=%%C %%D"

        REM Replace space with T in DATE_FORMAT to make it ISO 8601 compliant
        set DATE_FORMAT=!DATE_FORMAT: =T!

        REM Add a dummy file to commit
        echo dummy content > dummy.txt
        git add dummy.txt

        REM Commit with the specific date and message
        git commit --date="!DATE_FORMAT!" -m "!MESSAGE!"

        REM Clean up the dummy file
        del dummy.txt
    )
)

endlocal