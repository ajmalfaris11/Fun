@echo off
setlocal enabledelayedexpansion

:: Read the commit messages file
for /f "tokens=*" %%a in (commit-messages.txt) do (
    set "MESSAGE=%%a"

    :: Extract the commit date from the message
    for /f "tokens=1,2*" %%b in ("%%a") do set "DATE=%%c"

    :: Create a dummy file for the commit
    echo Dummy commit for !DATE! > dummy.txt

    :: Check if the file is created (optional debug step)
    if exist dummy.txt (
        echo Dummy.txt created successfully.
    ) else (
        echo Failed to create dummy.txt.
    )

    :: Add the file to git
    git add dummy.txt

    :: Commit with the specific date
    set "GIT_COMMITTER_DATE=!DATE!"
    git commit --date="!DATE!" -m "!MESSAGE!"
)

:: Clean up the dummy file
del dummy.txt
