#!/usr/bin/env bash

echo 'Installing Package 1: Contacts & Organizations...'
sfdx force:package:install -i 04t80000001AWvwAAG -w 100 -u brighton-dev-pr-6
if [ "$?" = "0" ]; then
	echo 'Installation of Package 1 complete...'
else
	echo 'Installation failed.'
	exit 1
fi

echo 'Installing Package 2: Households...'
sfdx force:package:install -i 04t80000000y8tyAAA -w 100 -u brighton-dev-pr-6
if [ "$?" = "0" ]; then
	echo 'Installation of Package 2 complete...'
else
	echo 'Installation failed.'
	exit 1
fi

echo 'Installing Package 3: Recurring Donations...'
sfdx force:package:install -i 04t80000000gZsgAAE -w 100 -u brighton-dev-pr-6
if [ "$?" = "0" ]; then
	echo 'Installation of Package 3 complete...'
else
	echo 'Installation failed.'
	exit 1
fi

echo 'Installing Package 4: Relationships...'
sfdx force:package:install -i 04t80000000y8kRAAQ -w 100 -u brighton-dev-pr-6
if [ "$?" = "0" ]; then
	echo 'Installation of Package 4 complete...'
else
	echo 'Installation failed.'
	exit 1
fi

echo 'Installing Package 5: Affiliations...'
sfdx force:package:install -i 04t80000000lTMlAAM -w 100 -u brighton-dev-pr-6
if [ "$?" = "0" ]; then
	echo 'Installation of Package 5 complete...'
else
	echo 'Installation failed.'
	exit 1
fi

echo 'Deploying record types...'
curl -O -L https://github.com/SalesforceFoundation/Cumulus/archive/master.zip
unzip master.zip
sfdx force:mdapi:deploy -d Cumulus-master/unpackaged/pre/account_record_types/ -w 100 -u brighton-dev-pr-6
if [ "$?" = "0" ]; then
	echo 'Deployment of Account Record Types complete...'
else
	echo 'Deployment failed.'
	exit 1
fi
sfdx force:mdapi:deploy -d Cumulus-master/unpackaged/pre/opportunity_record_types/ -w 100 -u brighton-dev-pr-6
if [ "$?" = "0" ]; then
	echo 'Deployment of Opportunity Record Types complete...'
else
	echo 'Deployment failed.'
	exit 1
fi
rm -rf Cumulus-master
rm master.zip

echo 'Installing Package 6: Core NPSP...'
sfdx force:package:install -i 04t1Y0000011SkhQAE -w 100 -u brighton-dev-pr-6
if [ "$?" = "0" ]; then
	echo 'Installation of Package 6 complete...'
else
	echo 'Installation failed.'
	exit 1
fi

echo 'Installing Package 7: Volunteers for Salesforce ...'
sfdx force:package:install -i 04t50000000cSq7AAE -w 100 -u brighton-dev-pr-6
if [ "$?" = "0" ]; then
	echo 'Installation of Package 6 complete...'
else
	echo 'Installation failed.'
	exit 1
fi
# note this is the version ID as of 9/27/2017
# it updates every 2 weeks
# depending on what you actually need, you may/may not want to go get the newest ID from
# https://github.com/SalesforceFoundation/Cumulus/releases

echo "Done installing NPSP! Would you like to open your scratch org now? [Y/N]"
read response
if [ "$response" == "Y" ]; then
	sfdx force:org:open
	exit 1
fi