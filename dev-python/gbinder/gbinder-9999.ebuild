# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_9 )
DISTUTILS_USE_SETUPTOOLS=no

inherit git-r3 distutils-r1

EGIT_REPO_URI="https://github.com/erfanoabdi/gbinder-python.git"

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
