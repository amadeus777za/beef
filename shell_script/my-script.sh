echo "Checking if an update is required to your local BeEF project"
rm github_file.txt

# PATTERN="^\d{1}\.\d{1}\.\d{1}\.\d{1}(-\D*)?$"
PATTERN="[0-9]{1}\.[0-9]{1}\.[0-9]{1}\.[0-9]{1}-.*"
# GITHUB_FILE=$(curl -s https://raw.githubusercontent.com/beefproject/beef/master/VERSION)
curl https://raw.githubusercontent.com/beefproject/beef/master/VERSION >> github_file.txt

# GITHUB_VERSION=$(egrep $PATTERN $GITHUB_FILE)
GITHUB_VERSION=$(egrep "echo $PATTERN" github_file.txt)
echo "GITHUB_VERSION = ${GITHUB_VERSION}"

LOCAL_VERSION=$(egrep "echo $PATTERN" /usr/share/beef-xss/VERSION)
echo "$LOCAL_VERSION"

if [[ $LOCAL_VERSION = $GITHUB_VERSION ]] ; then
echo "An update is required to the local version of your BeEF project." > logfile.log
echo          '----------------------------------------------------------------'
echo -e ${RED}'An update is required to the local version of your BeEF project.'
echo          '----------------------------------------------------------------'
exit 99
else
echo -e ${GREEN}' No update is required.'
fi
echo "-- Comparison completed"
