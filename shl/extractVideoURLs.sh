#!/usr/bin/env bash

function extractVideoURLs {
	for url
	do
		urlBase=$(echo "$url" | cut -d/ -f1-3)
		fqdn=$(echo "$url" | cut -d/ -f3)
		domain=$(echo $fqdn | awk -F. '{print$(NF-1)"."$NF}')
		sld=$(echo $fqdn | awk -F. '{print $(NF-1)}') # Second level domain
		if [ $sld = dailymotion ];then
			\curl -qs ${url/www/api}/videos | jq -r "\"$urlBase/video/\"+.list[].id"
		else
			\curl -qs $url | grep -w video | grep -oP 'href="\K/[^/][^ &"]+' | uniq | sed "s|^|$urlBase|"
		fi
	done
}

extractVideoURLs "$@"
