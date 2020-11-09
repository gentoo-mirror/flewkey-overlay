# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

if [[ ${PV} != *9999* ]]; then
	SRC_URI="https://github.com/patriciogonzalezvivo/glslViewer/archive/${PV}.tar.gz  -> ${P}.tar.gz"
	KEYWORDS="~amd64"
else
	inherit git-r3
	EGIT_REPO_URI="https://github.com/patriciogonzalezvivo/glslViewer.git"
fi

DESCRIPTION="Console-based sandbox for GLSL shaders"
HOMEPAGE="http://patriciogonzalezvivo.com/2015/glslViewer/"
LICENSE="BSD"
SLOT="0"

DEPEND="
	media-libs/glfw
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_unpack() {
	default
	mv "${WORKDIR}/glslViewer-${PV}" "${WORKDIR}/${P}"
}

src_install() {
	dobin "${S}/bin/glslScreenSaver"
	dobin "${S}/bin/glslLoader"
	dobin "${S}/bin/glslViewer"
}
