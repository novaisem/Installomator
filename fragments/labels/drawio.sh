drawio)
    name="draw.io"
    type="dmg"
    expectedTeamID="UZEUFB4N53"
    blockingProcesses=( draw.io )

    macOSVersionMajor=$(sw_vers -productVersion | cut -d. -f1)

    if [[ "$macOSVersionMajor" -ge 13 ]]; then
        # macOS 13+ : latest
        archiveName="draw.io-universal-[0-9.]*.dmg"
        downloadURL="$(downloadURLFromGit jgraph drawio-desktop)"
        appNewVersion="$(versionFromGit jgraph drawio-desktop)"
    elif [[ "$macOSVersionMajor" -eq 12 ]]; then
        # macOS 12 : 31.3.2
        downloadURL="https://github.com/jgraph/drawio-desktop/releases/download/v31.3.2/draw.io-universal-31.3.2.dmg"
        appNewVersion="31.3.2"
    fi
    ;;
