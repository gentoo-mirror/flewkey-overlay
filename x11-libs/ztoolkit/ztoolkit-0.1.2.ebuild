# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://gitlab.zrythm.org/zrythm/ztoolkit.git"
else
	MY_P="${PN}-v${PV}"
	S="${WORKDIR}/${MY_P}"
	SRC_URI="https://gitlab.zrythm.org/zrythm/${PN}/-/archive/v${PV}/${MY_P}.tar.bz2 -> ${P}.tar.bz2"
	KEYWORDS="~amd64"
fi

DESCRIPTION="GUI toolkit for LV2 plugins"
HOMEPAGE="https://git.zrythm.org/zrythm/ztoolkit"
LICENSE="GPL-3"
SLOT="0"
IUSE="rsvg"

DEPEND="
	rsvg? ( >=gnome-base/librsvg-2.14 )
	x11-libs/cairo
	x11-libs/libX11
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local emesonargs=(
		$(meson_use rsvg enable_rsvg)
	)
	meson_src_configure
}
