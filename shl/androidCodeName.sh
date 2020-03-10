#!/bin/bash

function androidCodeName {
	local androidRelease=$(getprop ro.build.version.release | cut -d. -f1-2 | tr -d .)

	local androidCodeName=$(getprop ro.build.version.codename)
	test $androidCodeName = REL && {
		androidCodeName="${colors[blue]}"
		case $androidRelease in
		10) androidCodeName+=NoCodename;;
		11) androidCodeName+="Petit Four";;
		15) androidCodeName+=Cupcake;;
		20|21) androidCodeName+=Eclair;;
		22) androidCodeName+=FroYo;;
		23) androidCodeName+=Gingerbread;;
		30|31|32) androidCodeName+=Honeycomb;;
		40) androidCodeName+="Ice Cream Sandwich";;
		41|42|43) androidCodeName+="Jelly Bean";;
		44) androidCodeName+=KitKat;;
		50|51) androidCodeName+=Lollipop;;
		60) androidCodeName+=Marshmallow;;
		70|71) androidCodeName+=Nougat;;
		80|81) androidCodeName+=Oreo;;
		90) androidCodeName+=Pie;;
		100) androidCodeName+=ToBeReleased;;
		*) androidCodeName=${colors[red]}unknown;;
		esac
	}
	echo $androidCodeName$normal
}

androidCodeName
