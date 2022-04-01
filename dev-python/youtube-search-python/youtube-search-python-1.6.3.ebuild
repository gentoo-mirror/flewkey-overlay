# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..10} )
DISTUTILS_USE_SETUPTOOLS=bdepend

inherit distutils-r1

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/alexmercerind/youtube-search-python.git"
else
	SRC_URI="https://github.com/alexmercerind/youtube-search-python/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

DESCRIPTION="YouTube scraping library"
HOMEPAGE="https://github.com/alexmercerind/youtube-search-python"
LICENSE="MIT"
SLOT="0"

DEPEND=""
RDEPEND="dev-python/httpx"
BDEPEND=""
