# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

SRC_URI="https://github.com/ssj71/reMID.lv2/archive/v${PV}.tar.gz  -> ${P}.tar.gz"
KEYWORDS="~amd64"

DESCRIPTION="A free software percussion synthesizer"
HOMEPAGE="https://github.com/ssj71/reMID.lv2"
LICENSE="GPL-2"
SLOT="0"

DEPEND="
	dev-libs/glib
	media-libs/alsa-lib
	media-libs/lv2
	virtual/jack
"
RDEPEND="${DEPEND}"
BDEPEND="
	virtual/pkgconfig
"

src_unpack() {
	default
	mv reMID.lv2-${PV} ${P}
}

src_configure() {
	local mycmakeargs=(
		"-DCMAKE_INSTALL_PREFIX:PATH=/usr"
	)
	CFLAGS+=" -D_BSD_SOURCE" cmake_src_configure
}

src_install() {
	cmake_src_install
	mv "${D}/usr/lib" "${D}/usr/$(get_libdir)"
}
