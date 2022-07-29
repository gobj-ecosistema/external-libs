#!/bin/bash
DIRECTORY="/c/yuneta/development/projects/windows"

if [ ! -d "$DIRECTORY" ];
then
    echo "No existe el directorio '$DIRECTORY'"
    exit
fi

cd $DIRECTORY

git add .
git commit -m "$1" --all
