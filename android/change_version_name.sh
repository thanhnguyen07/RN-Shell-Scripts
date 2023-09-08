BUILD_GRADLE_PATH="android/app/build.gradle"

current_version_name=$(awk -F'"' '/versionName/{print $2}' "$BUILD_GRADLE_PATH")

new_version_name=$(expr $current_version_name + 1)

awk -v current="\"$current_version_name\"" -v new="\"$new_version_name\"" '{sub("versionName " current, "versionName " new)} 1' $BUILD_GRADLE_PATH > tmpfile && mv tmpfile $BUILD_GRADLE_PATH


echo "Change versionName $current_version_name => $new_version_name"

