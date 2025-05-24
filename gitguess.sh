#!/bin/bash
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#
# This script runs through history of git and guesses the git commamds 
# Usgae: gitguess /path/to/repo
# Example: gitguess /usr/project/
#
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#


# Declare arrays globally
added=()
modified=()
deleted=()
renamed=()
copied=()

# Function to extract files from a commit
#git --git-dir=./.git  show --name-status  commitid
getfiles() {
    local commitid=$1
    local comment=$2
    added=()
    modified=()
    deleted=()
    renamed=()
    copied=()
    
    while IFS=$'\t' read -r status file newfile; do
        case "$status" in
            A) 
                added+=("$file")  
                ;;
            M) 
                modified+=("$file")  
                ;;
            D) 
                deleted+=("$file")  
                ;;
            R*) 
                renamed+=("$file -> $newfile")
                ;;    
            C*) 
                copied+=("$file -> $newfile")    
                ;;   
            *)
                echo "❓ Unknown status '$status' for $file"
                ;;    
        esac
    done < <(git --git-dir="${git_repo}"  show --name-status --pretty="" "$commitid")
}

# Main execution
repo_path=$1
git_repo="${repo_path}/.git"
echo "📘 Guessing git commands"
echo "Working on ${git_repo}"

# Use a regular loop (not a pipe, to avoid subshell)
while IFS= read -r line; do
    hash=$(echo "$line" | cut -d'|' -f1)
    author=$(echo "$line" | cut -d'|' -f2)
    date=$(echo "$line" | cut -d'|' -f3)
    comment=$(echo "$line" | cut -d'|' -f4-)
    echo "🔹 Author: $author on Date: $date  commitid: $hash "

    getfiles "$hash" "$comment"

    if [[ ${#added[@]} -gt 0 ]]; then
        echo "🟢 Added:    git add ${added[*]}"
    fi
    if [[ ${#modified[@]} -gt 0 ]]; then
        echo "🟡 Modified: git add ${modified[*]}"
    fi    
    if [[ ${#deleted[@]} -gt 0 ]]; then
        echo "🔴 Deleted:  git rm ${deleted[*]}"
    fi  
    if [[ ${#renamed[@]} -gt 0 ]]; then
        echo "🔵 Renamed:  git mv ${renamed[*]}"
    fi  
    if [[ ${#copied[@]} -gt 0 ]]; then
        echo "🔵 Copied:  git add ${copied[*]}"
    fi  
        echo "             git commit -m '$comment'" 
 
    echo "----------------------------------------------------"

done < <(git --git-dir="${git_repo}" log --all --reverse --pretty=format:"%H|%an|%ad|%s" --date=iso)
 