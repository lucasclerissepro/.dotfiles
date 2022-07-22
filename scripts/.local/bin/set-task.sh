#!/usr/bin/env zsh

set -e

task="$1"

if [[ $task == "" ]]; then
    echo "Provide the task as a first argument"
    exit 1
fi

taskFile="$HOME/Library/Application Support/Übersicht/widgets/current-task-widget-master/data.json"

toStore="{\"task\": \"$task\"}"

echo $toStore | tee "$taskFile" 
