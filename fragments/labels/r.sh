r)
    name="R"
    type="pkg"

    macOSVersionMajor=$(sw_vers -productVersion | cut -d. -f1)

    if [[ $(arch) == "arm64" && "$macOSVersionMajor" -ge 12 && "$macOSVersionMajor" -le 13 ]]; then
        # macOS 12-13 : 4.5.3
        downloadURL="https://cran.r-project.org/bin/macosx/big-sur-arm64/base/R-4.5.3-arm64.pkg"
        appNewVersion="4.5.3"
    elif [[ $(arch) == "arm64" && "$macOSVersionMajor" -ge 14 ]]; then
        # macOS 14+ : latest
        downloadURL="https://cloud.r-project.org/bin/macosx/$( curl -fsL https://cloud.r-project.org/bin/macosx/ | grep -m 1 -o '<a href=".*arm64\.pkg">' | sed -E 's/.+"(.+)".+/\1/g' )"
        appNewVersion=$(echo "${downloadURL}" | sed -E 's/.*\/[a-zA-Z]*-([0-9.]*)-.*\..*/\1/g')
    elif [[ $(arch) == "i386" && "$macOSVersionMajor" -ge 12 ]]; then
        # macOS 12+ : latest
        downloadURL="https://cloud.r-project.org/bin/macosx/$( curl -fsL https://cloud.r-project.org/bin/macosx/ | grep -o '<a href=".*pkg">' | grep -m 1 -v "arm64" | sed -E 's/.+"(.+)".+/\1/g' )"
        appNewVersion=$(echo "${downloadURL}" | sed -E 's/.*\/[a-zA-Z]*-([0-9.]*)\..*/\1/g')
    fi
    expectedTeamID="VZLD955F6P"
    appCustomVersion() { defaults read /Applications/r.app/Contents/Info.plist CFBundleShortVersionString | awk '{print $2}' }
    ;;
