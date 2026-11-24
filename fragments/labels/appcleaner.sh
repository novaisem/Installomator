appcleaner)
    name="AppCleaner"
    type="zip"
    expectedTeamID="X85ZX835W9"

    macOSVersionMajor=$(sw_vers -productVersion | cut -d. -f1)

    if [[ "$macOSVersionMajor" -ge 15 ]]; then
        # macOS 15+ : latest
        downloadURL=$(curl -fs https://freemacsoft.net/appcleaner/Updates.xml | xpath '//rss/channel/item[last()]/enclosure/@url' 2>/dev/null | tr " " "\n" | sort | tail -1 | cut -d '"' -f 2)
        appNewVersion=$(curl -fsL "https://freemacsoft.net/appcleaner/Updates.xml" | xpath '//rss/channel/item[last()]/enclosure/@sparkle:shortVersionString' 2>/dev/null | cut -d '"' -f 2)
    elif [[ "$macOSVersionMajor" -ge 12 && "$macOSVersionMajor" -le 14 ]]; then
        # macOS 12-14 : 3.6.8
        downloadURL="https://freemacsoft.net/downloads/AppCleaner_3.6.8.zip"
        appNewVersion="3.6.8"
    fi
    ;;
