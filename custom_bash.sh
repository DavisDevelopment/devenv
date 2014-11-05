# clone of Windows' "pause" command
pause () {
	read -n1 -r -p "Press any key to continue..." key
}

# auto-navigate to Dropbox code-folder
#alias godev='cd ~/Dropbox/MyCloudCode'

godev () {
	cd ~/Dropbox/MyCloudCode

	# if argument-1 is a subdirectory of [MyCloudCode]
	if [ -d ./$1 ]; then
		
		# navigate into that directory
		cd ./$1/
		
		# if this directory has a 'src' subdirectory
		if [ -d ./src/ ]; then
			cd ./src

			if [ -f ./.projectrc ]; then
				source ./.projectrc
			fi

			if [ -f ./.projectstart ]; then
				./.projectstart
			else
				touch ./.projectstart
				chmod +x ./.projectstart
				echo ""
				echo "=== Please Write a Project-Mounting Program ==="
				echo ""
				pause
				vim ./.projectstart
			fi

		fi

	else
		PROJ_NAME=$1

		makeproject () {

			mkdir ./$PROJ_NAME
			cd ./$PROJ_NAME

			mkdir ./src
			mkdir ./dist
			cd ./src

			touch ./.projectrc

			makegitrepo () {
				git init
			}

				
			while true; do
				read -p "Will this be a git repository? (Y / N)" yn
				
				case $yn in
					[Yy]* ) makegitrepo; break;;
					[Nn]* ) break;;
				* ) echo "Please answer yes or no.";;
				esac
			done
		}

		while true; do
			read -p "Project ".$1." does not exist. Would you like to create it? (Y / N)" yn
			
			case $yn in
				[Yy]* ) makeproject; break;;
				[Nn]* ) break;;
			* ) echo "Please answer yes or no.";;
			esac
		done
		fi
}

alias project='echo "$1"'
