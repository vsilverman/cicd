#!/bin/bash

# this script gets the list of installed plugins from running jenkins ci server

PORT=8080
MY_HOST=localhost
JENKINS_HOST=admin:admin@$MY_HOST:$PORT

curl -sSL "http://$JENKINS_HOST/pluginManager/api/xml?depth=1&xpath=/*/*/shortName|/*/*/version&wrapper=plugins" \
    | perl -pe 's/.*?<shortName>([\w-]+).*?<version>([^<]+)()(<\/\w+>)+/\1 \2\n/g' \
    |sed 's/ /:/' \
    > plugins.txt
