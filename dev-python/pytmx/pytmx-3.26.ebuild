# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{3,4,5,6,7,8,9} )
DISTUTILS_USE_SETUPTOOLS=bdepend

inherit distutils-r1

MY_PN="PyTMX"
MY_P="${MY_PN}-${PV}"
S="${WORKDIR}/${MY_P}"
SRC_URI="mirror://pypi/${MY_PN:0:1}/${MY_PN}/${MY_P}.tar.gz"
KEYWORDS="~amd64"

DESCRIPTION="Python library to read Tiled Map Editor's TMX maps"
HOMEPAGE="https://github.com/bitcraft/pytmx"
LICENSE="LGPL-3"
SLOT="0"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
