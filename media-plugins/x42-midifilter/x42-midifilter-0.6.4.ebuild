# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

if [[ ${PV} != *9999* ]]; then
	SRC_URI="https://github.com/x42/midifilter.lv2/archive/v${PV}.tar.gz  -> ${P}.tar.gz"
	KEYWORDS="~amd64"
else
	inherit git-r3
	EGIT_REPO_URI="https://github.com/x42/midifilter.lv2.git"
fi

DESCRIPTION="LV2 plugins for filtering MIDI events"
HOMEPAGE="https://x42-plugins.com/x42/x42-midifilter"
LICENSE="GPL-2"
SLOT="0"

DEPEND="
	media-libs/lv2
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_unpack() {
	if test ${PV} != 9999; then
		default
		mv "midifilter.lv2-${PV}" "${P}"
	else
		git-r3_src_unpack
	fi
}

src_compile() {
	emake STRIP="true" # Disable stripping
}

src_install() {
	emake DESTDIR="${D}" PREFIX="/usr" LV2DIR="/usr/$(get_libdir)/lv2" install
}
