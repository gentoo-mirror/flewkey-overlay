# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..11} )

inherit distutils-r1

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://gitlab.com/mocchapi/pyterminal.git"
else
	PYTERM_REF="6b4bbf8d6b28cee8d5b6171f82c5a644348cf47f" # 0.6b2
	MY_P="pyterminal-${PYTERM_REF}"
	S="${WORKDIR}/${MY_P}"
	SRC_URI="https://gitlab.com/mocchapi/pyterminal/-/archive/${PYTERM_REF}/archive.tar.bz2 -> ${P}.tar.bz2"
	KEYWORDS="~amd64"
fi

DESCRIPTION="Command line YouTube music streamer"
HOMEPAGE="https://gitlab.com/mocchapi/pyterminal"
LICENSE="GPL-3"
SLOT="0"
RESTRICT="test"

DEPEND=""
RDEPEND="
	${DEPEND}
	dev-python/feedparser
	dev-python/ffpyplayer
	dev-python/pafy
	dev-python/python-vlc
	dev-python/pypresence
	dev-python/youtube-search-python
	net-misc/youtube-dl
"
BDEPEND=""
