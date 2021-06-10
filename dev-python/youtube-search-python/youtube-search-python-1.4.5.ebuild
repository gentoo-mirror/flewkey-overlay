# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6..9} )
DISTUTILS_USE_SETUPTOOLS=bdepend

inherit distutils-r1

SRC_URI="https://github.com/alexmercerind/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
KEYWORDS="~amd64"

DESCRIPTION="YouTube scraping library"
HOMEPAGE="https://github.com/alexmercerind/youtube-search-python"
LICENSE="MIT"
SLOT="0"

DEPEND=""
RDEPEND="
	dev-python/httpx
"
BDEPEND=""
