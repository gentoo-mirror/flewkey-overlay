# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..13} )

inherit distutils-r1

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/bitcraft/pytmx.git"
else
	SRC_URI="https://github.com/bitcraft/pytmx/archive/v${PV}.tar.gz -> ${P}.gh.tar.gz"
	KEYWORDS="~amd64"
fi

DESCRIPTION="Python library to read Tiled Map Editor's TMX maps"
HOMEPAGE="https://github.com/bitcraft/pytmx"
LICENSE="LGPL-3"
SLOT="0"

RDEPEND="${DEPEND}"

distutils_enable_tests unittest
