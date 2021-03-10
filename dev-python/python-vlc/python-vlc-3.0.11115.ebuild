# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7,8} )

inherit distutils-r1

SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
KEYWORDS="~amd64"

DESCRIPTION="Python VLC bindings"
HOMEPAGE="https://wiki.videolan.org/Python_bindings/"
LICENSE="LGPL-2.1+"
SLOT="0"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
