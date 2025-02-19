#!/bin/bash

[ -z "$DISTRIBUTIVE" ] && source ../distribution.sh

echo "Depends for $DISTRIBUTIVE:"

# Case distribution:
case ${DISTRIBUTIVE} in
	Ubuntu | Mint )
		export DEPENDS_AFANASY="libpq5"
		export DEPENDS_QTGUI="libqt5network5 libqt5widgets5 libqt5multimedia5"
		export DEPENDS_CGRU="python3-pyqt5 openexr imagemagick"
		;;
	Debian )
		export DEPENDS_AFANASY="libpq5"
		export DEPENDS_QTGUI="libqt5network5 libqt5widgets5 libqt5multimedia5"
		export DEPENDS_CGRU="python3-pyqt5 openexr imagemagick"
		;;
	Fedora )
		export DEPENDS_AFANASY="libpqxx"
		export DEPENDS_QTGUI="qt5-qtmultimedia"
		export DEPENDS_CGRU="python3-pyside2 OpenEXR ImageMagick"
		;;
	openSUSE )
		export DEPENDS_AFANASY="libpq5"
		export DEPENDS_CGRU="python3-qt5 openexr ImageMagick"
		;;
	CentOS )
		export DEPENDS_AFANASY="libpq"
		export DEPENDS_CGRU="OpenEXR-libs"
		;;
	AltLinux )
		export DEPENDS_AFANASY="libpqxx"
		export DEPENDS_CGRU="python3 python3-module-PyQt5 openexr ImageMagick ffmpeg"
		;;
	Mageia )
		export DEPENDS_AFANASY="lib64pq5 lib64qt5core5 lib64qt5gui5 lib64qt5multimedia5 lib64qt5network5 lib64qt5widgets5"
		export DEPENDS_CGRU="python3-qt5 openexr imagemagick ffmpeg"
		;;
	*)
		export DEPENDS_AFANASY="python3 libpq"
		export DEPENDS_QTGUI="qt5-qtbase-gui qt5-qtmultimedia"
		export DEPENDS_CGRU="python3-qt5"
		;;
esac

for dep in $DEPENDS_AFANASY; do
	[ -z "$DEPENDS_AFANASY_COMMA" ] || DEPENDS_AFANASY_COMMA="${DEPENDS_AFANASY_COMMA}, "
	export DEPENDS_AFANASY_COMMA="${DEPENDS_AFANASY_COMMA}${dep}"
done

for dep in $DEPENDS_QTGUI; do
	[ -z "$DEPENDS_QTGUI_COMMA" ] || DEPENDS_QTGUI_COMMA="${DEPENDS_QTGUI_COMMA}, "
	export DEPENDS_QTGUI_COMMA="${DEPENDS_QTGUI_COMMA}${dep}"
done

for dep in $DEPENDS_CGRU; do
	[ -z "$DEPENDS_CGRU_COMMA" ] || DEPENDS_CGRU_COMMA="${DEPENDS_CGRU_COMMA}, "
	export DEPENDS_CGRU_COMMA="${DEPENDS_CGRU_COMMA}${dep}"
done

[ -z "$DEPENDS_AFANASY" ] || echo "DEPENDS_AFANASY = '$DEPENDS_AFANASY_COMMA'"
[ -z "$DEPENDS_QTGUI"   ] || echo "DEPENDS_QTGUI   = '$DEPENDS_QTGUI_COMMA'"
[ -z "$DEPENDS_CGRU"    ] || echo "DEPENDS_CGRU    = '$DEPENDS_CGRU_COMMA'"
