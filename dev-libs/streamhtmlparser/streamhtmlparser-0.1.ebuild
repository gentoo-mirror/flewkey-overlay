# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

if [[ ${PV} != *9999* ]]; then
	SRC_URI="https://github.com/google/${PN}/archive/${P}.tar.gz  -> ${P}.tar.gz"
	KEYWORDS="~amd64"
	MY_P=${PN}-${P}
	S="${WORKDIR}/${MY_P}"
else
	inherit git-r3
	EGIT_REPO_URI="https://github.com/google/streamhtmlparser.git"
fi

DESCRIPTION="Scan an HTML stream and provide context"
HOMEPAGE="https://github.com/google/streamhtmlparser"
LICENSE="BSD"
SLOT="0"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
