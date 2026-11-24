qgis-pr)
    name="QGIS"
    type="dmg"
    appNewVersion="$(curl -fsL "https://www.qgis.org/download/" | grep -oE 'current version is QGIS [0-9]+\.[0-9]+\.[0-9]+' | head -1 | grep -oE '[0-9]+\.[0-9]+\.[0-9]+')"
    downloadURL="https://download.qgis.org/downloads/macos/pr/qgis_pr_final-${appNewVersion//./_}.dmg"
    appName="QGIS-final-${appNewVersion//./_}.app"
    expectedTeamID="4F7N4UDA22"
    ;;
