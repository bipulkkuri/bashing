#!/bin/bash
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#
# This script runs through history of git and guesses the git commamds 
# Usgae: gitguess /path/to/repo
# Example: gitguess /usr/project/
#
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#

set -euo pipefail
# Colors using tput
bold=$(tput bold)
reset=$(tput sgr0)
cyan=$(tput setaf 6)
green=$(tput setaf 2)
yellow=$(tput setaf 3)
red=$(tput setaf 1)
blue=$(tput setaf 4)
magenta=$(tput setaf 5)
gray=$(tput setaf 7)

# Check for repository path argument
if [[ $# -ne 1 ]]; then
    echo "${red}❌ Usage:${reset} $0 /path/to/repo"
    exit 1
fi




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
                echo "${magenta}❓ Unknown status '$status' for $file${reset}"
                ;;    
        esac
    done < <(git --git-dir="${git_repo}"  show --name-status --pretty="" "$commitid")
}

# Main execution
repo_path=$1
git_repo="${repo_path}/.git"

if [[ ! -d $git_repo ]]; then
    echo "${red}❌ Not a valid Git repository:{reset} ${git_repo}"
    exit 1
fi

echo "${bold}${cyan}📘 Guessing git commands ${reset}"
echo "${cyan}Working on${reset} ${git_repo}"

# Use a regular loop (not a pipe, to avoid subshell)
DELIM=$'\x1F'  # ASCII unit separator
{
    git --git-dir="${git_repo}" log --all --reverse --pretty=format:"%H${DELIM}%an${DELIM}%ad${DELIM}%s${DELIM}%S${DELIM}%P" --date=iso
    echo  # handle newline gurantee for IFS
} | while IFS= read -r line; do
   
    IFS=$'\x1F' read -r hash author date comment refs parents<<< "$line"
    echo "🔹 Commit by: $author on $date"
    echo "🔸 Hash: $hash"
    [[ -n "$refs" ]] && echo "📛 Refs: $refs"
    [[ -n "$parents" ]] && echo "🧬 Parents: $parents"

    getfiles "$hash" "$comment"

    if [[ ${#added[@]} -gt 0 ]]; then
        echo "${green}🟢 Added:    git add ${added[*]}${reset}"
    fi
    if [[ ${#modified[@]} -gt 0 ]]; then
        echo "${yellow}🟡 Modified: git add ${modified[*]}${reset}"
    fi    
    if [[ ${#deleted[@]} -gt 0 ]]; then
        echo "${red}🔴 Deleted:  git rm ${deleted[*]}${reset}"
    fi  
    if [[ ${#renamed[@]} -gt 0 ]]; then
        echo "${blue}🔵 Renamed:  git mv ${renamed[*]}${reset}"
    fi  
    if [[ ${#copied[@]} -gt 0 ]]; then
        echo "${blue}🔵 Copied:  git add ${copied[*]}${reset}"
    fi  
    if [[ $parents =~ [[:space:]] ]]; then  #
       echo "${magenta}🔀 Detected merge: git merge ${parents// / }"
    fi
        echo "             git commit -m '$comment'" 
 
    echo "${gray}----------------------------------------------------${reset}"
done
  