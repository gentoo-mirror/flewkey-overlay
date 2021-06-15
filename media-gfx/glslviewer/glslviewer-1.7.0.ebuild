# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MY_PN="glslViewer"
MY_P="${MY_PN}-${PV}"
MINIAUDIO_V="0.10.35"
MINIAUDIO_REF="199d6a7875b4288af6a7b615367c8fdc2019b03c"
S="${WORKDIR}/${MY_P}"
SRC_URI="
	https://github.com/patriciogonzalezvivo/glslViewer/archive/${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/mackron/miniaudio/archive/${MINIAUDIO_REF}.tar.gz -> miniaudio-${MINIAUDIO_V}.tar.gz
"
KEYWORDS="~amd64"

DESCRIPTION="Console-based sandbox for GLSL shaders"
HOMEPAGE="http://patriciogonzalezvivo.com/2015/glslViewer/"
LICENSE="BSD"
SLOT="0"

DEPEND="media-libs/glfw"
RDEPEND="${DEPEND}"
BDEPEND=""

src_unpack() {
	default
	rm -rf "${S}/include/miniaudio" || die
	ln -s "${WORKDIR}/miniaudio-${MINIAUDIO_REF}" "${S}/include/miniaudio" || die
}

src_install() {
	dobin "${S}/glslViewer"
}
