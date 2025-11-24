#/bin/bash

echo "All variables passed: $@"
echo "Number of variables: $#"
echo "Script name: $0"
echo "present working directory: $PWD"
echo "Home directory of current user: $HOME"
echo "Which user is running this script: $USER"
echo "Processer id of current script: $$"
sleep 60 &
echo "Processer id of last command in background: $!"