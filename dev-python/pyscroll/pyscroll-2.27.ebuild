# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{5..9} )
DISTUTILS_USE_SETUPTOOLS=bdepend

inherit distutils-r1

if [[ ${PV} != *9999* ]]; then
	SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
	KEYWORDS="~amd64"
else
	inherit git-r3
	EGIT_REPO_URI="https://github.com/bitcraft/pyscroll.git"
fi

DESCRIPTION="Animated scrolling maps for Pygame"
HOMEPAGE="https://github.com/bitcraft/pyscroll"
LICENSE="LGPL-3"
SLOT="0"

DEPEND=""
RDEPEND="dev-python/pygame"
BDEPEND=""