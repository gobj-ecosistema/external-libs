#!/bin/bash
DIRECTORY="/c/yuneta/development/yuneta"

if [ ! -d "$DIRECTORY" ];
then
    echo "No existe el directorio '$DIRECTORY'"
    exit
fi

cd $DIRECTORY

for d in */
do
    if [[ $d =~ \^.* ]]
    then
        # group of projects
        GPROJECT="${d%/}"
        echo "^===>" $GPROJECT
        cd $GPROJECT
        GPROJECT=${GPROJECT:1}
        for s in */
        do
            # single project
            PROJECT="${s%/}"

            if [ "$PROJECT" == "build" ]; then
                continue
            fi
            if [ "$PROJECT" == "release" ]; then
                continue
            fi
            if [ "$PROJECT" == "venv" ]; then
                continue
            fi
            if [ "$PROJECT" == "cmake-build-debug" ]; then
                continue
            fi
            if [ "$PROJECT" == "cmake-build-release" ]; then
                continue
            fi
            echo "    ===>" $PROJECT
            cd $PROJECT

            if [ "$PROJECT" == "external" ]; then
                cd ..
                continue
            fi
            git add .
            git commit -m "$1" --all

            cd ..
        done
        cd ..
    else
        PROJECT="${d%/}"
        if [ "$PROJECT" == "build" ]; then
            continue
        fi
        if [ "$PROJECT" == "release" ]; then
            continue
        fi
        if [ "$PROJECT" == "venv" ]; then
            continue
        fi
        if [ "$PROJECT" == "cmake-build-debug" ]; then
            continue
        fi
        if [ "$PROJECT" == "cmake-build-release" ]; then
            continue
        fi
        #PROJECT="${s%/}"
        echo " ===>" $PROJECT
        cd $PROJECT

        if [ "$PROJECT" == "external" ]; then
            cd ..
            continue
        fi

        git add .
        git commit -m "$1" --all

        cd ..
    fi
done
