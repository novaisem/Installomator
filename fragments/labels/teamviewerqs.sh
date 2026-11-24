teamviewerqs)
    name="TeamViewerQS"
    type="dmg"
    expectedTeamID="H7UGFBUGV6"

    macOSVersionMajor=$(sw_vers -productVersion | cut -d. -f1)

    if [[ "$macOSVersionMajor" -ge 13 ]]; then
        # macOS 13+ : latest
        downloadURL="https://download.teamviewer.com/download/TeamViewerQS.dmg"
        appNewVersion=$(getJSONValue "$(curl -fsL https://www.teamviewer.com/en/solutions/use-cases/quicksupport/ | grep .dmg |  grep -o 'data-json="[^"]*"' | sed 's/data-json="//;s/"$//' | sed 's/&quot;/"/g' )" "data[0].versionNumber")
    elif [[ "$macOSVersionMajor" -eq 12 ]]; then
        # macOS 12 : 15.71.4
        downloadURL="https://download.teamviewer.com/download/version_15x/15.71.4/TeamViewerQS.dmg"
        appNewVersion="15.71.4"
    fi
    ;;
