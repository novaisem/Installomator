microsoftword)
    name="Microsoft Word"
    type="pkg"
    expectedTeamID="UBF8T346G9"
    versionKey="CFBundleVersion"
    blockingProcesses=( "Microsoft Word" )

    macOSVersionMajor=$(sw_vers -productVersion | cut -d. -f1)

    if [[ "$macOSVersionMajor" -ge 14 ]]; then
        # macOS 14+ : latest
        MAUSource="https://res.public.onecdn.static.microsoft/mro1cdnstorage/C1297A47-86C4-4C1F-97FA-950631F94777/MacAutoupdate/0409MSWD2019.xml"
        downloadURL=$(curl -fsL $MAUSource | xmllint --xpath '//array/dict[1]/key[text()="FullUpdaterLocation"]/following-sibling::string[1]/text()' - | sed 's/_Updater/_Installer/' 2>/dev/null)
        appNewVersion=$(curl -fsL $MAUSource | xmllint --xpath '//array/dict[1]/key[text()="Update Version"]/following-sibling::string[1]/text()' - 2>/dev/null)
        if [[ -x "/Library/Application Support/Microsoft/MAU2.0/Microsoft AutoUpdate.app/Contents/MacOS/msupdate" && $INSTALL != "force" && $DEBUG -eq 0 ]]; then
            printlog "Running msupdate --list"
            "/Library/Application Support/Microsoft/MAU2.0/Microsoft AutoUpdate.app/Contents/MacOS/msupdate" --list
        fi
        updateTool="/Library/Application Support/Microsoft/MAU2.0/Microsoft AutoUpdate.app/Contents/MacOS/msupdate"
        updateToolArguments=( --install --apps MSWD2019 )
    elif [[ "$macOSVersionMajor" -eq 13 ]]; then
        # macOS 13 : 16.101.3
        downloadURL="https://officecdn.microsoft.com/pr/C1297A47-86C4-4C1F-97FA-950631F94777/MacAutoupdate/Microsoft_Word_16.101.25100321_Updater.pkg"
        appNewVersion="16.101.25100321"
    elif [[ "$macOSVersionMajor" -eq 12 ]]; then
        # macOS 12 : 16.89.1
        downloadURL="https://officecdn.microsoft.com/pr/C1297A47-86C4-4C1F-97FA-950631F94777/MacAutoupdate/Microsoft_Word_16.89.24091630_Updater.pkg"
        appNewVersion="16.89.24091630"
    fi
    ;;
