# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_9 )
DISTUTILS_USE_SETUPTOOLS=no

inherit distutils-r1

EGIT_COMMIT="834198b2e6cbeebdce80e982a81b1bf37bb3adbd"
MY_PN="${PN}-python"
MY_P="${MY_PN}-${EGIT_COMMIT}"
S="${WORKDIR}/${MY_P}"
SRC_URI="https://github.com/erfanoabdi/gbinder-python/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"
KEYWORDS="~amd64"

DESCRIPTION="Python bindings for libgbinder"
HOMEPAGE="https://github.com/erfanoabdi/gbinder-python"
LICENSE="GPL-3"
SLOT="0"

DEPEND="dev-libs/gbinder"
RDEPEND="${DEPEND}"
BDEPEND="
	virtual/pkgconfig
	dev-python/cython[${PYTHON_USEDEP}]
"

python_compile() {
	distutils-r1_python_compile --cython
}
