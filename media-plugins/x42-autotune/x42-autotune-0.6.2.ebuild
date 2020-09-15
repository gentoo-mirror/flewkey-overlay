# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

V_ROBTK="0.7.1"
SRC_URI="
	https://github.com/x42/fat1.lv2/archive/v${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/x42/robtk/archive/v${V_ROBTK}.tar.gz -> robtk-${V_ROBTK}.tar.gz
"
KEYWORDS="~amd64"

DESCRIPTION="LV2 Autotune plugin based on Fons Adriaensen's zita-at1"
HOMEPAGE="http://x42-plugins.com/x42/x42-autotune"
LICENSE="GPL-2"
SLOT="0"

DEPEND="
	media-libs/lv2
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_unpack() {
	default
	mv "fat1.lv2-${PV}" "${P}" || die
	rm -rf "${S}/robtk" || die
	cp -r "${WORKDIR}/robtk-${V_ROBTK}" "${S}/robtk" || die
}

src_compile() {
	emake STRIP="true" # Disable stripping
}

src_install() {
	emake DESTDIR="${D}" PREFIX="/usr" LV2DIR="/usr/$(get_libdir)/lv2" install
}
