# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..12} )

inherit distutils-r1

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/fengsp/color-thief-py.git"
else
	SRC_URI="https://github.com/fengsp/color-thief-py/archive/${PV}.tar.gz -> ${P}.gh.tar.gz"
	MY_PN="color-thief-py"
	MY_P="${MY_PN}-${PV}"
	S="${WORKDIR}/${MY_P}"
	KEYWORDS="~amd64"
fi

DESCRIPTION="A module for grabbing the color palette from an image."
HOMEPAGE="https://lokeshdhakar.com/projects/color-thief/"
LICENSE="BSD"
SLOT="0"
RESTRICT="test"

DEPEND=""
RDEPEND="
	${DEPEND}
	dev-python/pillow[${PYTHON_USEDEP}]
"
BDEPEND=""
