# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{3,4,5,6,7,8,9} )
DISTUTILS_USE_SETUPTOOLS=bdepend

inherit distutils-r1

SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
KEYWORDS="~amd64"

DESCRIPTION="Animated scrolling maps for Pygame"
HOMEPAGE="https://github.com/bitcraft/pyscroll"
LICENSE="LGPL-3"
SLOT="0"

DEPEND=""
RDEPEND="
	${DEPEND}
	dev-python/pygame
"
BDEPEND=""
