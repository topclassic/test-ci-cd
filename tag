#!/bin/bash

makeSureInput() {
    echo "Are you sure ? [y/n]"
    read var
    if [ -z $var ]; then
        exit 0
    elif [ $var == "y" ]; then
        return
    else
        exit 0
    fi
}
currentVersion() {
    echo "Fetch tags"
    git fetch --prune --tags
    version=$(git describe --abbrev=0 --tags)
    if [ -z $version ]; then
        version='this first tag'
    else
        version=${version:1}
    fi

    echo "$(tput setaf 6)$(tput bold)Current version: $(tput setaf 4)$(tput bold)$version$(tput sgr 0)"
    increment=(${version//./ })
}
if [ $# -eq 0 ]; then
    echo "$(tput setaf 1)$(tput bold)Please fill arguments [major/minor/path]$(tput sgr 0)"
    exit 0
elif [ $1 == "major" ]; then
    echo "$(tput setaf 6)$(tput bold)Update tag version $(tput setaf 4)$(tput bold)major.x.x$(tput sgr 0)"
    currentVersion
    ((increment[0]++))
    increment[1]=0
    increment[2]=0
elif [ $1 == "minor" ]; then
    echo "$(tput setaf 6)$(tput bold)Update tag version $(tput setaf 4)$(tput bold)x.minor.x$(tput sgr 0)"
    currentVersion
    ((increment[1]++))
    increment[2]=0
elif [ $1 == "path" ]; then
    echo "$(tput setaf 6)$(tput bold)Update tag version $(tput setaf 4)$(tput bold)x.x.path$(tput sgr 0)"
    currentVersion
    ((increment[2]++))
else
    echo "$(tput setaf 1)$(tput bold)Please fill arguments [major/minor/path]$(tput sgr 0)"
    exit 0
fi

set -e
git pull origin master
next_version="${increment[0]}.${increment[1]}.${increment[2]}"
msg="Update version $1 by $(git config user.name)"
echo "$(tput setaf 6)$(tput bold)Add new git tag $(tput setaf 4)$(tput bold)v$next_version $(tput setaf 6)$(tput bold)with message: $(tput setaf 4)$(tput bold)$msg $(tput sgr 0)"
makeSureInput
git tag -a "v$next_version" -m "$msg"
git push --tags origin master
echo "$(tput setaf 2)$(tput bold)Push tag success$(tput sgr 0)"
