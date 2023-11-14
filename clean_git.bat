@echo off
REM This script will clear the git commit history
REM Reference: [1]
REM Step 1: Create a new branch without any history
git checkout --orphan new_branch
REM Step 2: Add the files you want to keep and commit
git add -A
git commit -m "first commit"
REM Step 3: Delete the original branch and rename the new branch
git branch -D master
git branch -m master
git reflog expire --expire=now --all && git gc --prune=now --aggressive
REM Step 4: Force push the new branch to the remote repository
git push -f origin master