# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{5,6,7,8} )
DISTUTILS_USE_SETUPTOOLS=bdepend

inherit distutils-r1

SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
KEYWORDS="~amd64"

DESCRIPTION="Open source game networking framework for Python"
HOMEPAGE="https://github.com/ShadowBlip/Neteria"
LICENSE="GPL-2"
SLOT="0"

DEPEND=""
RDEPEND="
	${DEPEND}
	dev-python/rsa
"
BDEPEND=""
