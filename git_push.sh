if ! git diff --quiet
then
	echo "`date` Changes were present so PUSHED to central"
        git add $(git diff --name-only)

	git commit -m "`date` AUTO_COMIT"

	git push
else
	echo "`date` Changes were NOT present "

fi
