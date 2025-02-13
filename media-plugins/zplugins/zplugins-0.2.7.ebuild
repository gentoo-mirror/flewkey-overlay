# Copyright 2020-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://gitlab.zrythm.org/zrythm/zplugins.git"
else
	MY_P="${PN}-v${PV}"
	S="${WORKDIR}/${MY_P}"
	SRC_URI="https://gitlab.zrythm.org/zrythm/${PN}/-/archive/v${PV}/${MY_P}.tar.bz2 -> ${P}.tar.bz2"
	KEYWORDS="~amd64"
fi

DESCRIPTION="A collection of audio DSP plugins"
HOMEPAGE="https://gitlab.zrythm.org/zrythm/zplugins"
LICENSE="GPL-3"
SLOT="0"

DEPEND="
	dev-scheme/guile
	media-libs/libsndfile
	x11-libs/ztoolkit[rsvg]
"
RDEPEND="${DEPEND}"

src_configure() {
	local emesonargs=(
		"-Dlv2dir=$(get_libdir)/lv2"
	)
	meson_src_configure
}
