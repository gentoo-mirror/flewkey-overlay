# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..11} )

inherit distutils-r1

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/numba/numba.git"
else
	SRC_URI="https://github.com/numba/numba/archive/${PV}.tar.gz -> ${P}.gh.tar.gz"
	KEYWORDS="~amd64"
fi

DESCRIPTION="NumPy aware dynamic Python compiler using LLVM "
HOMEPAGE="https://numba.pydata.org/"
LICENSE="BSD-2"
SLOT="0"
RESTRICT="test"

DEPEND="
	dev-python/numpy[${PYTHON_USEDEP}]
"
RDEPEND="
	${DEPEND}
	dev-python/importlib_metadata[${PYTHON_USEDEP}]
	dev-python/llvmlite[${PYTHON_USEDEP}]
	dev-python/setuptools[${PYTHON_USEDEP}]
"
BDEPEND=""

pkg_postinst() {
	einfo "This ebuild is incomplete."
	einfo "If possible, use the version in the science overlay instead."
}
