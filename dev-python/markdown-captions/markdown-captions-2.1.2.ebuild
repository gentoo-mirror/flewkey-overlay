# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..13} )

inherit distutils-r1

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/Evidlo/markdown_captions.git"
else
	PYPI_NO_NORMALIZE=1
	inherit pypi
	KEYWORDS="~amd64"
fi

DESCRIPTION="Image captions for python-markdown"
HOMEPAGE="https://github.com/Evidlo/markdown_captions"
LICENSE="GPL-3"
SLOT="0"

RDEPEND="dev-python/markdown"
