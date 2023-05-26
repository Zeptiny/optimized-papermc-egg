#!/bin/ash
# Paper Installation Script
#
# Server Files: /mnt/server
PROJECT=paper
if [ -n "${DL_PATH}" ]; then
echo -e "Using supplied download url: ${DL_PATH}"
DOWNLOAD_URL=`eval echo $(echo ${DL_PATH} | sed -e 's/{{/${/g' -e 's/}}/}/g')`
else
VER_EXISTS=`curl -s https://api.papermc.io/v2/projects/${PROJECT} | jq -r --arg VERSION $MINECRAFT_VERSION '.versions[] | contains($VERSION)' | grep -m1 true`
LATEST_VERSION=`curl -s https://api.papermc.io/v2/projects/${PROJECT} | jq -r '.versions' | jq -r '.[-1]'`
if [ "${VER_EXISTS}" == "true" ]; then
echo -e "Version is valid. Using version ${MINECRAFT_VERSION}"
else
echo -e "Specified version not found. Defaulting to the latest ${PROJECT} version"
MINECRAFT_VERSION=${LATEST_VERSION}
fi
BUILD_EXISTS=`curl -s https://api.papermc.io/v2/projects/${PROJECT}/versions/${MINECRAFT_VERSION} | jq -r --arg BUILD ${BUILD_NUMBER} '.builds[] | tostring | contains($BUILD)' | grep -m1 true`
LATEST_BUILD=`curl -s https://api.papermc.io/v2/projects/${PROJECT}/versions/${MINECRAFT_VERSION} | jq -r '.builds' | jq -r '.[-1]'`
if [ "${BUILD_EXISTS}" == "true" ]; then
echo -e "Build is valid for version ${MINECRAFT_VERSION}. Using build ${BUILD_NUMBER}"
else
echo -e "Using the latest ${PROJECT} build for version ${MINECRAFT_VERSION}"
BUILD_NUMBER=${LATEST_BUILD}
fi
JAR_NAME=${PROJECT}-${MINECRAFT_VERSION}-${BUILD_NUMBER}.jar
echo "Version being downloaded"
echo -e "MC Version: ${MINECRAFT_VERSION}"
echo -e "Build: ${BUILD_NUMBER}"
echo -e "JAR Name of Build: ${JAR_NAME}"
DOWNLOAD_URL=https://api.papermc.io/v2/projects/${PROJECT}/versions/${MINECRAFT_VERSION}/builds/${BUILD_NUMBER}/downloads/${JAR_NAME}
fi
cd /mnt/server
echo -e "Running curl -o ${SERVER_JARFILE} ${DOWNLOAD_URL}"
if [ -f ${SERVER_JARFILE} ]; then
mv ${SERVER_JARFILE} ${SERVER_JARFILE}.old
fi
curl -o ${SERVER_JARFILE} ${DOWNLOAD_URL}
if [ "${OPTIMIZATION_CATEGORY}" == "basic" ]; then
echo -e "Basic Optimization Category Selected"
	if [ ! -f server.properties ]; then
	echo -e "Downloading Basic server.properties Optimization"
	curl -o server.properties https://raw.githubusercontent.com/Zeptiny/optimized-papermc-egg/main/basic/server.properties
	else
	echo -e "A server.properties file already exists, skipping Basic Optimized server.properties download"
	fi
	if [ ! -f bukkit.yml ]; then
	echo -e "Downloading Basic bukkit.yml Optimization"
	curl -o bukkit.yml https://raw.githubusercontent.com/Zeptiny/optimized-papermc-egg/main/basic/bukkit.yml
	else
	echo -e "A bukkit.yml file already exists, skipping Basic Optimized bukkit.yml download"
	fi
	if [ ! -f spigot.yml ]; then
	echo -e "Downloading Basic spigot.yml Optimization"
	curl -o spigot.yml https://raw.githubusercontent.com/Zeptiny/optimized-papermc-egg/main/basic/spigot.yml
	else
	echo -e "A spigot.yml file already exists, skipping Basic Optimized spigot.yml download"
	fi
	cd /config
	if [ ! -f paper-global.yml ]; then
	echo -e "Downloading Basic paper-global.yml Optimization"
	curl -o paper-global.yml https://raw.githubusercontent.com/Zeptiny/optimized-papermc-egg/main/basic/config/paper-global.yml
	else
	echo -e "A paper-global.yml file already exists, skipping Basic Optimized paper-global.yml download"
	fi
	if [ ! -f paper-world-defaults.yml ]; then
	echo -e "Downloading Basic paper-world-defaults.yml Optimization"
	curl -o paper-world-defaults.yml https://raw.githubusercontent.com/Zeptiny/optimized-papermc-egg/main/basic/config/paper-world-defaults.yml
	else
	echo -e "A paper-world-defaults.yml file already exists, skipping Basic Optimized paper-world-defaults.yml download"
	fi
echo -e "Basic Optimization Files Download Completed"
fi