# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..11} )
DISTUTILS_USE_SETUPTOOLS=bdepend

inherit distutils-r1

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/Evidlo/markdown_captions.git"
else
	SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
	KEYWORDS="~amd64"
fi

DESCRIPTION="Image captions for python-markdown"
HOMEPAGE="https://github.com/Evidlo/markdown_captions"
LICENSE="GPL-3"
SLOT="0"

DEPEND=""
RDEPEND="dev-python/markdown"
BDEPEND=""
