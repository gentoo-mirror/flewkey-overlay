# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3
EGIT_REPO_URI="https://github.com/patriciogonzalezvivo/glslViewer.git"
EGIT_SUBMODULES=( include/miniaudio )

DESCRIPTION="Console-based sandbox for GLSL shaders"
HOMEPAGE="http://patriciogonzalezvivo.com/2015/glslViewer/"
LICENSE="BSD"
SLOT="0"

DEPEND="media-libs/glfw"
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	dobin "${S}/glslViewer"
}
