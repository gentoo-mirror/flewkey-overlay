# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{6..9} )

inherit distutils-r1

if [[ ${PV} != *9999* ]]; then
	SRC_URI="https://github.com/tkrajina/gpxpy/archive/v${PV}.tar.gz  -> ${P}.tar.gz"
	KEYWORDS="~amd64"
else
	inherit git-r3
	EGIT_REPO_URI="https://github.com/tkrajina/gpxpy.git"
fi

DESCRIPTION="GPX file parser and GPS track manipulation library"
HOMEPAGE="https://github.com/tkrajina/gpxpy"
LICENSE="Apache-2.0"
SLOT="0"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
