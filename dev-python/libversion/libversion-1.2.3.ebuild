# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6..9} )
DISTUTILS_USE_SETUPTOOLS=bdepend

inherit distutils-r1

MY_PN="py-${PN}"
MY_P="${MY_PN}-${PV}"
S="${WORKDIR}/${MY_P}"
SRC_URI="https://github.com/repology/${MY_PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"
KEYWORDS="~amd64"

DESCRIPTION="Python bindings for libversion"
HOMEPAGE="https://github.com/repology/py-libversion"
LICENSE="MIT"
SLOT="0"

DEPEND="dev-libs/libversion"
RDEPEND="${DEPEND}"
BDEPEND="virtual/pkgconfig"

distutils_enable_tests setup.py
