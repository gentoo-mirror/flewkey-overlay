# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..11} )

inherit distutils-r1

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/bmcfee/resampy.git"
	EGIT_SUBMODULES=()
else
	SRC_URI="https://github.com/bmcfee/resampy/archive/${PV}.tar.gz -> ${P}.gh.tar.gz"
	KEYWORDS="~amd64"
fi

DESCRIPTION="Efficient resampler for Python"
HOMEPAGE="https://resampy.readthedocs.io/"
LICENSE="ISC"
SLOT="0"
RESTRICT="test"

DEPEND=""
RDEPEND="
	${DEPEND}
	dev-python/numba[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]
"
BDEPEND=""
