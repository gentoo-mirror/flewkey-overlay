# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{10..12} )

inherit distutils-r1 pypi

DESCRIPTION="Protobufs with dataclass support"
HOMEPAGE="https://eigenein.github.io/protobuf/"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND="dev-python/hatch-vcs[${PYTHON_USEDEP}]"
