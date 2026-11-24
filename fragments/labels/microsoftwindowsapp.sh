microsoftwindowsapp)
    name="Windows App"
    type="pkg"
    expectedTeamID="UBF8T346G9"

    macOSVersionMajor=$(sw_vers -productVersion | cut -d. -f1)

    if [[ "$macOSVersionMajor" -ge 13 ]]; then
        # macOS 13+ : latest
        MAUSource="https://res.public.onecdn.static.microsoft/mro1cdnstorage/C1297A47-86C4-4C1F-97FA-950631F94777/MacAutoupdate/0409MSRD10.xml"
        downloadURL=$(curl -fsL $MAUSource | xmllint --xpath '//array/dict[1]/key[text()="Location"]/following-sibling::string[1]/text()' - | sed 's/_updater/_installer/' 2>/dev/null)
        appNewVersion=$(curl -fsL $MAUSource | xmllint --xpath '//array/dict[1]/key[text()="Title"]/following-sibling::string[1]/text()' - | grep -oE '[\.0-9]*' 2>/dev/null)
        if [[ -x "/Library/Application Support/Microsoft/MAU2.0/Microsoft AutoUpdate.app/Contents/MacOS/msupdate" && $INSTALL != "force" && $DEBUG -eq 0 ]]; then
            printlog "Running msupdate --list"
            "/Library/Application Support/Microsoft/MAU2.0/Microsoft AutoUpdate.app/Contents/MacOS/msupdate" --list
        fi
        updateTool="/Library/Application Support/Microsoft/MAU2.0/Microsoft AutoUpdate.app/Contents/MacOS/msupdate"
        updateToolArguments=( --install --apps MSRD10 )
    elif [[ "$macOSVersionMajor" -eq 12 ]]; then
        # macOS 12 : 11.2.0
        downloadURL="https://officecdn.microsoft.com/pr/C1297A47-86C4-4C1F-97FA-950631F94777/MacAutoupdate/Windows_App_11.2.0_installer.pkg"
        appNewVersion="11.2.0"
    fi
    ;;
