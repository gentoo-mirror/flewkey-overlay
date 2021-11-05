# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{5..10} )
DISTUTILS_USE_SETUPTOOLS=bdepend

inherit distutils-r1

if [[ ${PV} != *9999* ]]; then
	SRC_URI="https://github.com/Zuzu-Typ/PyGLM/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
	MY_PN="PyGLM"
	MY_P="${MY_PN}-${PV}"
	S="${WORKDIR}/${MY_P}"
else
	inherit git-r3
	EGIT_REPO_URI="https://github.com/Zuzu-Typ/PyGLM.git"
fi

DESCRIPTION="Fast OpenGL Mathematics"
HOMEPAGE="https://github.com/Zuzu-Typ/PyGLM"
LICENSE="ZLIB"
SLOT="0"

RDEPEND=""
BDEPEND=""
