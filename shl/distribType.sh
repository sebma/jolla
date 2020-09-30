#!/usr/bin/env bash

distribType ()
{
	local distribName=unknown
	local distribType=unknown
	echo $OSTYPE | grep -q android && local osFamily=Android || local osFamily=$(uname -s)

	distribName=$(distribName.sh | awk '{print tolower($0)}')

		if [ $osFamily = Linux ]; then
			case $distribName in
				sailfishos|rhel|fedora|centos) distribType=redhat ;;
				ubuntu) distribType=debian;;
				*) distribType=$distribName ;;
			esac
		else
			if [ $osFamily = Darwin ]; then
				distribType=Darwin
			else
				distribType=$osFamily
			fi
		fi

	echo $distribType
}

distribType
