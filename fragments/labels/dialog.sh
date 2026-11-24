dialog)
    name="Dialog"
    type="pkg"
    packageID="au.csiro.dialogcli"
    expectedTeamID="PWA5E9TQ59"

    macOSVersionMajor=$(sw_vers -productVersion | cut -d. -f1)

    if [[ "$macOSVersionMajor" -ge 15 ]]; then
        # macOS 15+ : latest
        downloadURL="$(downloadURLFromGit swiftDialog swiftDialog)"
        appNewVersion="$(versionFromGit swiftDialog swiftDialog)"
    elif [[ "$macOSVersionMajor" -ge 12 && "$macOSVersionMajor" -le 14 ]]; then
        # macOS 12-14 : 2.5.6
        downloadURL="https://github.com/swiftDialog/swiftDialog/releases/download/v2.5.6/dialog-2.5.6-4805.pkg"
        appNewVersion="2.5.6"
    fi
    ;;
