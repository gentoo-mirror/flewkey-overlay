# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

if [[ ${PV} != *9999* ]]; then
	MY_PN="BSpacr"
	MY_P="${MY_PN}-${PV}"
	S="${WORKDIR}/${MY_P}"
	SRC_URI="https://github.com/sjaehn/${MY_PN}/archive/refs/tags/${PV}.tar.gz  -> ${P}.tar.gz"
	KEYWORDS="~amd64"
else
	inherit git-r3
	EGIT_REPO_URI="https://github.com/sjaehn/BSpacr.git"
fi

DESCRIPTION="LV2 sound effect plugin"
HOMEPAGE="https://github.com/sjaehn/BSpacr"
LICENSE="GPL-3"
SLOT="0"

DEPEND="
	media-libs/lv2
	x11-libs/libX11
	x11-libs/cairo[X]
"
RDEPEND="${DEPEND}"
BDEPEND="
	virtual/pkgconfig
"

src_install() {
	emake DESTDIR="${D}" PREFIX="/usr" LV2DIR="/usr/$(get_libdir)/lv2" install
}
