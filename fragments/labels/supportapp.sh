supportapp)
    name="Support"
    type="pkg"
    packageID="nl.root3.support"
    expectedTeamID="98LJ4XBGYK"
    blockingProcesses=( NONE )

    macOSVersionMajor=$(sw_vers -productVersion | cut -d. -f1)

    if [[ "$macOSVersionMajor" -ge 14 ]]; then
        # macOS 14+ : latest
        downloadURL="$(downloadURLFromGit root3nl SupportApp)"
        appNewVersion="$(versionFromGit root3nl SupportApp)"
    elif [[ "$macOSVersionMajor" -ge 12 && "$macOSVersionMajor" -le 13 ]]; then
        # macOS 12-13 : 2.6.4
        downloadURL="https://github.com/root3nl/SupportApp/releases/download/v2.6.4/Support.2.6.4.pkg"
        appNewVersion="2.6.4"
    fi
    ;;
