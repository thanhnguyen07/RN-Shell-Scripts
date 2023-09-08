# Be sure to run firebase login

Env=$1

# Error color
RED='\033[0;31m'
NC='\033[0m'

PATH_APK_FILE=android/app/build/outputs/apk/release/app-release.apk
PATH_AAB_FILE=android/app/build/outputs/bundle/release/app-release.aab

APP_ID=1:123test:android:132
GROUP_NAME=GroupName

TEST_NOTES="Test ENV"
PRODUCTION_NOTES="Production ENV"

if test -f "$PATH_APK_FILE"; then
    case "${Env}" in
    "ENV_NAME_1" )
        firebase appdistribution:distribute "${PATH_APK_FILE}" --app "${APP_ID}" --release-notes "${TEST_NOTES}" --groups "${GROUP_NAME}"
    ;;

    "ENV_NAME_2" )
        firebase appdistribution:distribute "${PATH_APK_FILE}" --app "${APP_ID}" --release-notes "${PRODUCTION_NOTES}" --groups "${GROUP_NAME}"
    ;;
    esac
else
    echo -e "${RED}Error: File apk not found in path ${PATH_APK_FILE}${NC}"
fi