# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{5..9} )
DISTUTILS_USE_SETUPTOOLS=bdepend

inherit distutils-r1

SRC_URI="https://github.com/qwertyquerty/pypresence/archive/${PV}.tar.gz  -> ${P}.tar.gz"
KEYWORDS="~amd64"

DESCRIPTION="Discord IPC and Rich Presence wrapper for Python"
HOMEPAGE="https://qwertyquerty.github.io/pypresence/html/index.html"
LICENSE="MIT"
SLOT="0"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
