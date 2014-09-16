#!/bin/bash



echo ""
echo ""
#bedast avardane id karbar ba estefade az dastoore $(id) (uid=userId)
echo "************************************************************"

#------------ba estefade az dastoore awk------------------

echo  "bedast avardane UID ba dastoore awk :"
echo -n "User UID is: "
echo $(id) | awk -F'uid' '{print $2}' | awk -F'=' '{print $2}' | awk -F'(' '{print $1}'

#.---------ba estefade az halghehaye sharti -------------.

echo "bedast avardane UID ba estefade az halghehaye shari :"
getUserId=$(id)
found='true'
foundUid='false'



for (( i=0; i<${#getUserId}; i++ )) do

if [ ${getUserId:$i:3} == 'uid' -o $foundUid=='true' ]
then
	foundUid=='true'
while [ "${getUserId:$i:1}" != "=" ] 
	do
		let "i++"

	done
	let "i++"
		while [ "${getUserId:$i:1}" != "(" ]
		do
			userId+=${getUserId:$i:1}
			let "i++"


		done
		found="false"
		break;


fi

done
echo -e "User ID is :\e[0;31m$userId\e[0m"

#bedast avardane esme karbar
echo "************************************************************"
found='true'
foundUid='false'



for (( i=0; i<${#getUserId}; i++ )) do

if [ ${getUserId:$i:3} == 'uid' -o $foundUid=='true' ]
then
	foundUid=='true'
while [ "${getUserId:$i:1}" != "(" ] 
	do
		let "i++"

	done
	let "i++"
		while [ "${getUserId:$i:1}" != ")" ]
		do
			userLoginName+=${getUserId:$i:1}
			let "i++"


		done
		found="false"
		break;


fi

done
echo -en "User \e[0;34m $userLoginName \e[0mhas logged in"

#bedast avardane tedad dafa'ate logine karbare mazkoor dar bala

userLoginTimes=$(last | grep -c $userLoginName)
echo -en " \e[1;33m $userLoginTimes \e[0m times"
echo ""
echo ""
echo "************************************************************"
