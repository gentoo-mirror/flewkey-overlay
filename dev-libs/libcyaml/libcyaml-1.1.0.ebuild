EAPI=7

if [[ ${PV} != *9999* ]]; then
	SRC_URI="https://files.2a03.party/~flewkey/distfiles/${P}.tar.gz"
	KEYWORDS="~amd64"
else
	inherit git-r3
	EGIT_REPO_URI="https://github.com/tlsa/libcyaml/"
fi

DESCRIPTION="C library for reading and writing YAML"
HOMEPAGE="https://github.com/tlsa/libcyaml/"
LICENSE="ISC"
SLOT="0"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_compile() {
	emake VARIANT=release
}

src_install() {
	emake DESTDIR="${D}" PREFIX="/usr" LIBDIR="lib64" VARIANT=release install
}
