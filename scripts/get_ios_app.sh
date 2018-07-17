urldecode() {
    # urldecode <string>

   local url_encoded="${1//+/ }"
    printf "%b" "${url_encoded//%/\\x}"
}

printf "tile_production_adhoc" > temp.txt
curl -u felipe.kuhn:6cdcdd72c4b9051a44311c2be4a8698b http://tiledev8:8081/view/Release%20Builds/job/iOS%20Tile%20app%20-%20Development%20Branch/lastSuccessfulBuild/api/json | grep -Eo "tile_production_adhoc_(.*).ipa" | awk -F',' '{ print $1 }' | sed "s/\"//" | xargs echo > temp.txt

thetileapp_ipa="$(cat temp.txt)"
thetileapp_ipa="$(urldecode $thetileapp_ipa)"
rm temp.txt

thetileapp_jenkins_user=felipe.kuhn
thetileapp_jenkins_pass=6cdcdd72c4b9051a44311c2be4a8698b

thetileapp_ios_url=http://tiledev8:8081/view/Release%20Builds/job/iOS%20Tile%20app%20-%20Development%20Branch/lastSuccessfulBuild/artifact/build/$thetileapp_ipa
thetileapp_ios_authed_url=http://$thetileapp_jenkins_user:$thetileapp_jenkins_pass@tiledev8:8081/view/Release%20Builds/job/iOS%20Tile%20app%20-%20Development%20Branch/lastSuccessfulBuild/artifact/build/$thetileapp_ipa

echo $thetileapp_ios_authed_url
printf "${thetileapp_ios_authed_url//%/\\x}" > jenkins_app.txt

curl -u felipe.kuhn:6cdcdd72c4b9051a44311c2be4a8698b -O "$thetileapp_ios_url"
