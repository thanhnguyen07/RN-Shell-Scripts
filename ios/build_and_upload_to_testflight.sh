PATH_XCWORKSPACE=ios/test.xcworkspace
PATH_IPA_FILE=ios/IPA/test.ipa
PATH_ARCHIVE_FILE=ios/Archive.xcarchive
PATH_IPA_FOLDER=ios/IPA/
PATH_EXPORT_FILE=ios/export_staging_options.plist

SCHEMA_NAME=TestSchema

email=test@gmail.com
APP_SPECIFIC_PASSWORD=test-dasda-das-ryxe

# Change env
./change_env.sh envname;

# Remove old file
rm -r "${PATH_IPA_FOLDER}"*;
rm -r "${PATH_ARCHIVE_FILE}"*;

# Up version
cd ios; agvtool next-version; cd ..;

# Build ipa file
xcodebuild -workspace "${PATH_XCWORKSPACE}" -destination generic/platform=iOS -scheme "${SCHEMA_NAME}" -archivePath "${PATH_ARCHIVE_FILE}" archive
# Export ipa file
xcodebuild -exportArchive -archivePath "${PATH_ARCHIVE_FILE}" -exportPath "${PATH_IPA_FOLDER}" -exportOptionsPlist "${PATH_EXPORT_FILE}"

# Check if the ipa file exists
if test -f "$PATH_IPA_FILE"; then
    # upload ipa file to TestFlight
    xcrun altool --upload-app --type ios -f "${PATH_IPA_FILE}" -u "${email}" -p "${APP_SPECIFIC_PASSWORD}";

    # remove file
    rm -r "${PATH_IPA_FOLDER}"*;
    rm -r "${PATH_ARCHIVE_FILE}"*;
else
    echo -e "${RED}Error: File ipa not found in path ${PATH_IPA_FILE}${NC}"
fi
