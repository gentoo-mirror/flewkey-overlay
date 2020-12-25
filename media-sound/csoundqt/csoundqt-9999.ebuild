# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# TODO: PythonQt, RtMidi, fix dependencies

EAPI=7

inherit qmake-utils desktop xdg-utils

if [[ ${PV} != *9999* ]]; then
	SRC_URI="https://github.com/CsoundQt/CsoundQt/archive/v${PV}.tar.gz  -> ${P}.tar.gz"
	KEYWORDS="~amd64"
else
	inherit git-r3
	EGIT_REPO_URI="https://github.com/CsoundQt/CsoundQt.git"
fi

DESCRIPTION="The default frontend for Csound"
HOMEPAGE="https://csoundqt.github.io/"
LICENSE="LGPL-2.1"
SLOT="0"

DEPEND="
	dev-qt/qtcore:5
	dev-qt/qtwidgets:5
	media-libs/libsndfile
	media-sound/csound
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_unpack() {
	if [[ ${PV} != *9999* ]]; then
		default
		mv "${WORKDIR}/CsoundQt-${PV}" "${WORKDIR}/${P}"
	else
		git-r3_src_unpack
	fi
}

src_prepare() {
	default
	sed -i "s/build64:LCSOUND = -lcsound64/build64:LCSOUND = -lcsound/" qcs-unix.pro
}

src_configure() {
	default
	eqmake5 qcs.pro CSOUND_API_INCLUDE_DIR=/usr/include/csound \
		CSOUND_LIBRARY_DIR="/usr/$(get_libdir)" CSOUND_LIB=libcsound.so \
		LCSOUND=-lcsound INSTALL_DIR="${D}/usr" SHARE_DIR="${D}/usr/share"
}

pkg_postinst() {
	xdg_mimeinfo_database_update
	xdg_desktop_database_update
	xdg_icon_cache_update
}

pkg_postrm() {
	xdg_mimeinfo_database_update
	xdg_desktop_database_update
	xdg_icon_cache_update
}
