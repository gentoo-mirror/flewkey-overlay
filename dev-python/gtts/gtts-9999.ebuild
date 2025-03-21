# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..13} )

inherit distutils-r1

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/pndurette/gTTS.git"
else
	MY_PN="gTTS"
	MY_P="${MY_PN}-${PV}"
	S="${WORKDIR}/${MY_P}"
	SRC_URI="https://github.com/pndurette/gTTS/archive/v${PV}.tar.gz  -> ${P}.gh.tar.gz"
	KEYWORDS="~amd64"
fi

DESCRIPTION="Python library for Google's text-to-speech"
HOMEPAGE="https://gtts.readthedocs.io/en/latest/"
LICENSE="MIT"
SLOT="0"
RESTRICT="test" # Tests require network access

RDEPEND="${DEPEND}"
