# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{5..10} )
DISTUTILS_USE_SETUPTOOLS=bdepend

inherit distutils-r1
if [[ ${PV} != *9999* ]]; then
	SRC_URI="https://github.com/qwertyquerty/pypresence/archive/${PV}.tar.gz  -> ${P}.tar.gz"
	KEYWORDS="~amd64"
else
	inherit git-r3
	EGIT_REPO_URI="https://github.com/qwertyquerty/pypresence.git"
fi

DESCRIPTION="Discord IPC and Rich Presence wrapper for Python"
HOMEPAGE="https://qwertyquerty.github.io/pypresence/html/index.html"
LICENSE="BSD"
SLOT="0"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
