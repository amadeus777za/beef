echo "Checking if an update to your local BeEF project is required..."
rm github_file.txt

# Obtain beef version from GitHub beef project
# Replace the path below with /usr/share/beef-xss/
curl https://raw.githubusercontent.com/beefproject/beef/master/VERSION >> github_file.txt

GITHUB_VERSION=$(egrep -f pattern.txt github_file.txt)
echo "$GITHUB_VERSION"

# Obtain Beef version of local project
LOCAL_VERSION=$(egrep -f pattern.txt /Users/francois.vanderhoven/code/beef-core/VERSION)
echo "$LOCAL_VERSION"

if [[ $LOCAL_VERSION < $GITHUB_VERSION ]] ; then
echo "An update is required to the local version of your Beef project." > logfile.log
echo          '-----------------------------------------------------------------'
echo -e ${RED}' An update is required to the local version of your Beef project.'
echo          '-----------------------------------------------------------------'
exit 99
else
echo -e ${GREEN}' No update is required.'
fi
echo '-- The End --'
