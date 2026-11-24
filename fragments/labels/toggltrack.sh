toggltrack)
    name="Toggl"
    type="dmg"
    if [[ $(arch) == "arm64" ]]; then
        downloadURL="https://toggl.com/toggl/desktop/downloads/Toggl-arm64.dmg"
    elif [[ $(arch) == "i386" ]]; then
        downloadURL="https://toggl.com/toggl/desktop/downloads/Toggl-x64.dmg"
    fi
    appNewVersion=$(curl -fsL "https://toggl.com/toggl/desktop/downloads/latest-mac.yml" | awk '/^version:/{print $2}')
    expectedTeamID="B227VTMZ94"
    ;;
