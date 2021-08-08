# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6..9} )
DISTUTILS_USE_SETUPTOOLS=bdepend

inherit distutils-r1

if [[ ${PV} != *9999* ]]; then
	MY_PN="python-${PN}"
	MY_P="${MY_PN}-${PV}"
	S="${WORKDIR}/${MY_P}"
	SRC_URI="https://github.com/warner/python-spake2/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
else
	inherit git-r3
	EGIT_REPO_URI="https://github.com/warner/python-spake2.git"
fi

DESCRIPTION="Python implementation of SPAKE2"
HOMEPAGE="https://github.com/warner/python-spake2"
LICENSE="MIT"
SLOT="0"

RDEPEND="dev-python/hkdf[${PYTHON_USEDEP}]"
BDEPEND=""

distutils_enable_tests pytest
