#!/bin/bash
#commands for operation on directories are listed below:-
case "$1" in
	addDir)
            if [[ $# -ne 3 ]]; then
                    echo "The format is wrong. Correct format - addDir <path> <directory name>"
                    exit 1
            fi

            mkdir "$2/$3"
            ;;

	deleteDir)
            if [[ $# -ne 3 ]]; then
                    echo "The format is wrong. Correct format - deleteDir <path> <directory name>"
                    exit 1
            fi
            rm -r "$2/$3"
            ;;

	listContent)
            if [[ $# -ne 2 ]]; then
                    echo "The format is wrong. Correct format - listContent <directory path>"
                    exit 1
            fi
            ls "$2"
			;;

	listFiles)
            if [[ $# -ne 2 ]]; then
                	echo "The fomat is wrong. Correct format - listFiles <path>"
                	exit 1
            fi
            find "$2" -mindepth 1 -maxdepth 1 -type f
            ;;

    listDirs)
            if [[ $# -ne 2 ]]; then
                	echo "Wrong format give command <path>"
                	exit 1
            fi
            find "$2" -maxdepth 1 -type d
            ;;

	listAll)
        	if [[ $# -ne 2 ]]; then
        			echo "The format is wrong. Correct format - listAll <path>"
        			exit 1
        	fi
        	ls -a "$2"
        	;;
#commands for operation on files are listed below:-
	addFile)
        	if [[ $# -eq 3 ]]; then
        		touch "$2/$3"
        	elif [[ $# -eq 4 ]]; then
        		echo "$4" > "$2/$3"
        	else
    			echo "Usage: createFile <path> <file> [content]"
    			exit 1
        	fi
        	;;

	addContentToFile)
        	if [[ $# -ne 4 ]]; then
        		echo "The format is wrong. Correct format - command <path> <file> <content>"
        		exit 1
        	fi
        	echo "$4" >> "$2/$3"
        	;;

	addContentToFileBegining)
        	if [[ $# -ne 4 ]]; then
        		echo "The format is wrong. Correct format - command <path> <file> <content>"
        		exit 1
        	fi
        	temp=$(mktemp)
        	echo "$4" > "$temp"
        	cat "$2/$3" >> "$temp"
        	mv "$temp" "$2/$3"
        	;;

	showFileBeginingContent)
        	if [[ $# -ne 4 ]]; then
        		echo "The format is wrong. Correct format - command <path> <file> <n>"
        		exit 1
        	fi
        	head -n "$4" "$2/$3"
        	;;

	showFileEndContent)
        	if [[ $# -ne 4 ]]; then
        		echo "The format is wrong. Correct format - command <path> <file> <n>"
        		exit 1
        	fi
        	tail -n "$4" "$2/$3"
        	;;

	showFileContentAtLine)
        	if [[ $# -ne 4 ]]; then
        		echo "The format is wrong. Correct format - command <path> <file> <n>"
        		exit 1
        	fi
        	head -n "$4" "$2/$3" | tail -n 1
        	;;

	showFileContentForLineRange)
        	if [[ $# -ne 5 ]]; then
        		echo "The format is wrong. Correct format - command <path> <file> <n> <n>"
        		exit 1
        	fi
        	head -n "$5" "$2/$3" | tail -n +"$4"
        	;;

	moveFile)
        	if [[ $# -ne 3 ]]; then
        		echo "The format is wrong. Correct format - give: command <source> <destination>"
        		exit 1
        	fi
        	mv "$2" "$3"
        	;;

	copyFile)
        	if [[ $# -ne 3 ]]; then
        		echo "The format is wrong. Correct format - give: command <source> <destination>"
        		exit 1
        	fi
        	cp "$2" "$3"
        	;;

	deleteFile)
        	if [[ $# -ne 3 ]]; then
        		echo "The format is wrong. Correct format - give: command <path> <file>"
        		exit 1
        	fi
        	rm "$2/$3" 
        	;;

	clearFileContent)
        	if [[ $# -ne 3 ]]; then
        		echo "The format is wrong. Correct format - give: command <path> <file>"
        		exit 1
        	fi
        	> "$2/$3" 
        	;;

	showContent)
	    	if [[ $# -ne 3 ]]; then
		    	echo "Wrong format give: command <path> <file>"
		        exit 1    
			fi
		    cat "$2/$3"
		    ;;

	*)
        	echo "Invalid Command"
esac