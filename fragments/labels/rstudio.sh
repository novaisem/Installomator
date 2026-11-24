rstudio)
    name="RStudio"
    type="dmg"
    expectedTeamID="FYF2F5GFX4"

    macOSVersionMajor=$(sw_vers -productVersion | cut -d. -f1)

    if [[ "$macOSVersionMajor" -ge 14 ]]; then
        # macOS 14+ : latest
        downloadURL="https://rstudio.org/download/latest/stable/desktop/mac/RStudio-latest.dmg"
        finalURL=$(curl -fsLI -o /dev/null -w "%{url_effective}" "$downloadURL")
        appNewVersion=$(echo "$finalURL" | grep -oE '[0-9]{4}\.[0-9]{2}\.[0-9]{1,2}\-[0-9]+' | sed 's/-/+/')
    elif [[ "$macOSVersionMajor" -eq 13 ]]; then
        # macOS 13 : 2025.09.1+401
        downloadURL="https://download1.rstudio.org/electron/macos/RStudio-2025.09.1-401.dmg"
        appNewVersion="2025.09.1+401"
    elif [[ "$macOSVersionMajor" -eq 12 ]]; then
        # macOS 12 : 2024.09.1+394
        downloadURL="https://download1.rstudio.org/electron/macos/RStudio-2024.09.1-394.dmg"
        appNewVersion="2024.09.1+394"
    fi
    ;;
