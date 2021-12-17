# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{3..10} )
DISTUTILS_USE_SETUPTOOLS=bdepend

inherit distutils-r1

if [[ ${PV} != *9999* ]]; then
	SRC_URI="https://github.com/bitcraft/pytmx/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
else
	inherit git-r3
	EGIT_REPO_URI="https://github.com/bitcraft/pytmx.git"
fi

DESCRIPTION="Python library to read Tiled Map Editor's TMX maps"
HOMEPAGE="https://github.com/bitcraft/pytmx"
LICENSE="LGPL-3"
SLOT="0"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

distutils_enable_tests unittest
