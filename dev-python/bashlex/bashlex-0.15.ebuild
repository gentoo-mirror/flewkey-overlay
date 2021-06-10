# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{5..9} )

inherit distutils-r1

if [[ ${PV} != *9999* ]]; then
	SRC_URI="https://github.com/idank/bashlex/archive/refs/tags/${PV}.tar.gz  -> ${P}.tar.gz"
	KEYWORDS="~amd64"
else
	inherit git-r3
	EGIT_REPO_URI="https://github.com/idank/bashlex.git"
fi

DESCRIPTION="Python parser for bash"
HOMEPAGE="https://github.com/idank/bashlex"
LICENSE="GPL-3"
SLOT="0"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
