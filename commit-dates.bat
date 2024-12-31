@echo off

:: Define commit dates and commit messages
set dates=2024-01-01 09:15:00 2024-01-02 10:20:00 2024-01-03 11:00:00
set messages="first commit" "second commit" "third commit"

:: Loop through each date and create a commit
for /f "tokens=1,2" %%d in ("%dates%") do (
    echo %%d > commit_%%d.txt
    echo %%d > commit-dates.bat

    :: Add the commit-dates.bat file to staging
    git add commit-dates.bat
    git add commit_%%d.txt

    :: Commit with the message from the list
    git commit -m "!messages!"

    :: Reset the files for the next commit
    git reset HEAD commit-dates.bat
)

:: Push the changes to the repository
git push
