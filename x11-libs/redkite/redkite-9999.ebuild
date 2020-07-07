EAPI=7

inherit cmake-utils

if [[ ${PV} != *9999* ]]; then
	SRC_URI="https://github.com/iurie-sw/redkite/archive/v${PV}.tar.gz  -> ${P}.tar.gz"
	KEYWORDS="~amd64"
else
	inherit git-r3
	EGIT_REPO_URI="https://github.com/iurie-sw/redkite.git"
fi

DESCRIPTION="A small GUI toolkit"
HOMEPAGE="https://github.com/iurie-sw/redkite"
LICENSE="GPL-3"
SLOT="0"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
