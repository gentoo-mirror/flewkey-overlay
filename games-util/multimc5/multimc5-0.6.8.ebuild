# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

V_QUAZIP="multimc-3"
V_LIBNBTPLUSPLUS="multimc-0.6.1"
SRC_URI="
	https://github.com/MultiMC/MultiMC5/archive/${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/MultiMC/quazip/archive/${V_QUAZIP}.tar.gz -> quazip-${V_QUAZIP}.tar.gz
	https://github.com/MultiMC/libnbtplusplus/archive/${V_LIBNBTPLUSPLUS}.tar.gz -> libnbtplusplus-${V_LIBNBTPLUSPLUS}.tar.gz
"
KEYWORDS="~amd64"

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

src_unpack() {
	default
	rm -rf "${S}/libraries/libnbtplusplus" "${S}/libraries/quazip" || die
	cp -r "${WORKDIR}/quazip-${V_QUAZIP}" "${S}/libraries/quazip" || die
	cp -r "${WORKDIR}/libnbtplusplus-${V_LIBNBTPLUSPLUS}" "${S}/libraries/libnbtplusplus" || die
}

src_configure() {
	local mycmakeargs=(
		"-DCMAKE_INSTALL_PREFIX:PATH=/usr"
		"-DMultiMC_LAYOUT:STRING=lin-system"
	)
	cmake_src_configure
}
