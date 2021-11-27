# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{6..9} )
DISTUTILS_USE_SETUPTOOLS=bdepend

inherit distutils-r1

if [[ ${PV} != *9999* ]]; then
	MY_PN="Tuxemon"
	MY_P="${MY_PN}-${PV}"
	S="${WORKDIR}/${MY_P}"
	SRC_URI="https://github.com/Tuxemon/Tuxemon/archive/v${PV}.tar.gz  -> ${P}.tar.gz"
	KEYWORDS="~amd64"
else
	inherit git-r3
	EGIT_REPO_URI="https://github.com/Tuxemon/Tuxemon.git"
fi

DESCRIPTION="Open source monster-fighting RPG"
HOMEPAGE="https://www.tuxemon.org/"
LICENSE="GPL-3"
SLOT="0"
IUSE="+rumble"

DEPEND="
	dev-python/Babel
"
RDEPEND="
	${DEPEND}
	dev-python/cbor
	dev-python/natsort
	dev-python/pillow
	dev-python/requests
	dev-python/prompt_toolkit
	>=dev-python/pygame-2.1.0
	dev-python/pytmx
	dev-python/pyscroll
	dev-python/pyyaml
	dev-python/neteria
	rumble? ( dev-libs/libshake )
"
BDEPEND=""

src_prepare() {
	sed -i "s/\/user\/share/\/usr\/share/" "${S}/tuxemon/constants/paths.py"
	distutils-r1_src_prepare
}

src_install() {
	distutils-r1_src_install
	dodir /usr/share/tuxemon
	cp -r "${S}/mods" "${D}/usr/share/tuxemon"
}
