# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

if [[ ${PV} != *9999* ]]; then
	SRC_URI="https://gitlab.com/jobol/mustach/-/archive/${PV}/mustach-${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
else
	inherit git-r3
	EGIT_REPO_URI="https://gitlab.com/jobol/mustach.git"
fi

DESCRIPTION="C implementation of mustache templating"
HOMEPAGE="https://gitlab.com/jobol/mustach"
LICENSE="ISC"
SLOT="0"

DEPEND="
	dev-libs/json-c
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_compile() {
	emake lib_LDFLAGS="-shared -Wl,-soname=libmustach.so.0.99"
}

src_install() {
	emake DESTDIR="${D}" PREFIX="/usr" LIBDIR="/usr/$(get_libdir)" install
}
