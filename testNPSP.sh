echo 'Installing Package 2: Households...'
sfdx force:package:install -i 04t80000000y8tyAAA -w 100
if [ "$?" = "0" ]; then
	echo 'Installation of Package 2 complete...'
else
	echo 'Installation failed!'
	exit 1
fi

