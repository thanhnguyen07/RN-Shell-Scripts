BUILD_GRADLE_PATH="android/app/build.gradle"

current_version_code=$(grep -o 'versionCode [0-9]*' $BUILD_GRADLE_PATH | awk '{print $2}')

new_version_code=$((current_version_code + 1))

awk -v current="$current_version_code" -v new="$new_version_code" '{sub("versionCode " current, "versionCode " new)} 1' $BUILD_GRADLE_PATH > tmpfile && mv tmpfile $BUILD_GRADLE_PATH

echo "Up versionCode $current_version_code => $new_version_code"
