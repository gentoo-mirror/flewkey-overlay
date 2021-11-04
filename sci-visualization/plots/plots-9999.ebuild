# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{6..9} )
DISTUTILS_USE_SETUPTOOLS=bdepend

inherit distutils-r1

if [[ ${PV} != *9999* ]]; then
	SRC_URI="https://github.com/alexhuntley/Plots/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
	MY_PN="Plots"
	MY_P="${MY_PN}-${PV}"
	S="${WORKDIR}/${MY_P}"
else
	inherit git-r3
	EGIT_REPO_URI="https://github.com/alexhuntley/Plots.git"
fi

DESCRIPTION="Graph plotting app for GNOME"
HOMEPAGE="https://github.com/alexhuntley/Plots"
LICENSE="GPL-3"
SLOT="0"

RDEPEND="
	dev-python/freetype-py
	dev-python/jinja
	dev-python/lark-parser
	dev-python/numpy
	dev-python/pyglm
	dev-python/pygobject
	dev-python/pyopengl
"
BDEPEND=""

src_prepare() {
	default
	sed -i "s/find_packages()/find_packages(exclude=['tests'])/" "${S}/setup.py"
}

distutils_enable_tests pytest
