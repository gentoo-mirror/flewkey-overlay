# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{6..9} )
DISTUTILS_USE_SETUPTOOLS=bdepend

inherit distutils-r1

if [[ ${PV} != *9999* ]]; then
	SRC_URI="https://github.com/alexmercerind/youtube-search-python/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
else
	inherit git-r3
	EGIT_REPO_URI="https://github.com/alexmercerind/youtube-search-python.git"
fi

DESCRIPTION="YouTube scraping library"
HOMEPAGE="https://github.com/alexmercerind/youtube-search-python"
LICENSE="MIT"
SLOT="0"

DEPEND=""
RDEPEND="dev-python/httpx"
BDEPEND=""