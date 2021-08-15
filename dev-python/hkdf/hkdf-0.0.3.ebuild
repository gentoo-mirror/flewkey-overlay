# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6..9} )
DISTUTILS_USE_SETUPTOOLS=bdepend

inherit distutils-r1

if [[ ${PV} != *9999* ]]; then
	EGIT_COMMIT="ba0e2eee8f50cc84706f816dbc57897319e2250c"
	MY_PN="python-${PN}"
	MY_P="${MY_PN}-${EGIT_COMMIT}"
	S="${WORKDIR}/${MY_P}"
	SRC_URI="https://github.com/casebeer/python-hkdf/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
else
	inherit git-r3
	EGIT_REPO_URI="https://github.com/casebeer/python-hkdf.git"
fi

DESCRIPTION="Python implementation of HKDF"
HOMEPAGE="https://github.com/casebeer/python-hkdf"
LICENSE="BSD-2"
SLOT="0"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""