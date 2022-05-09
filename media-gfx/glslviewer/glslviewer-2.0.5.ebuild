# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

if [[ ${PV} != *9999* ]]; then
	MY_PN="glslViewer"
	MY_P="${MY_PN}-${PV}"
	ADA_REF="416db9da40d9b22bca1ca088672946d9d8e44f67"
	MINIAUDIO_V="0.10.42"
	MINIAUDIO_REF="dbca7a3b44594e0226f887472b31f54aa5f14214"
	S="${WORKDIR}/${MY_P}"
	SRC_URI="
		https://github.com/patriciogonzalezvivo/glslViewer/archive/${PV}.tar.gz -> ${P}.tar.gz
		https://github.com/patriciogonzalezvivo/ada/archive/${ADA_REF}.tar.gz -> ada-${ADA_REF}.tar.gz
		https://github.com/mackron/miniaudio/archive/${MINIAUDIO_REF}.tar.gz -> miniaudio-${MINIAUDIO_V}.tar.gz
	"
	KEYWORDS="~amd64"
else
	inherit git-r3
	EGIT_REPO_URI="https://github.com/patriciogonzalezvivo/glslViewer.git"
	EGIT_SUBMODULES=( deps/ada deps/miniaudio )
fi

DESCRIPTION="Console-based sandbox for GLSL shaders"
HOMEPAGE="http://patriciogonzalezvivo.com/2015/glslViewer/"
LICENSE="BSD"
SLOT="0"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_unpack() {
	if [[ ${PV} != *9999* ]]; then
		default
		rm -rf "${S}/deps/ada" "${S}/deps/miniaudio" || die
		ln -s "${WORKDIR}/ada-${ADA_REF}" "${S}/deps/ada" || die
		ln -s "${WORKDIR}/miniaudio-${MINIAUDIO_REF}" "${S}/deps/miniaudio" || die
	else
		git-r3_src_unpack
	fi
}

src_install() {
	dobin "${S}/build/glslViewer"
}
