# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

EGIT_REPO_URI="https://github.com/MultiMC/MultiMC5.git"

inherit git-r3 cmake

DESCRIPTION="MultiMC Minecraft Launcher"
HOMEPAGE="https://multimc.org/"
LICENSE="Apache-2.0"
SLOT="0"

DEPEND=">=virtual/jre-1.8:*"
RDEPEND="${DEPEND}"
BDEPEND="
	>=virtual/jdk-1.8:*
	>=dev-util/cmake-3.1
	dev-qt/qtcore
	dev-qt/qtconcurrent
	media-libs/mesa
	sys-libs/zlib
"

src_configure() {
	local mycmakeargs=(
		"-DCMAKE_INSTALL_PREFIX:PATH=/usr"
		"-DMultiMC_LAYOUT:STRING=lin-system"
	)
	cmake_src_configure
}
