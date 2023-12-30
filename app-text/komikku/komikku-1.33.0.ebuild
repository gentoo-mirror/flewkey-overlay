# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
PYTHON_REQ_USE="sqlite(+),ssl(+)"
DISTUTILS_USE_PEP517=no
DISTUTILS_SINGLE_IMPL=1
inherit distutils-r1 meson gnome2-utils xdg

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://gitlab.com/valos/Komikku.git"
else
	MY_PN="${PN^}"
	MY_P="${MY_PN}-v${PV}"
	S="${WORKDIR}/${MY_P}"
	SRC_URI="https://gitlab.com/valos/Komikku/-/archive/v${PV}/${MY_P}.tar.bz2 -> ${P}.tar.bz2"
	KEYWORDS="~amd64"
fi

DESCRIPTION="An online/offline manga reader for GNOME"
HOMEPAGE="https://gitlab.com/valos/Komikku"
LICENSE="GPL-3+"
SLOT="0"
RESTRICT="test"

DEPEND="
	dev-libs/glib:2
	dev-libs/gobject-introspection
	>=gui-libs/gtk-4.10:4
	>=gui-libs/libadwaita-1.3:1[introspection]
	net-libs/webkit-gtk:6[introspection]
"
RDEPEND="
	${DEPEND}
	$(python_gen_cond_dep '
		app-arch/brotli[python,${PYTHON_USEDEP}]
		dev-python/aiohttp[${PYTHON_USEDEP}]
		dev-python/beautifulsoup4[${PYTHON_USEDEP}]
		dev-python/colorthief[${PYTHON_USEDEP}]
		dev-python/cffi[${PYTHON_USEDEP}]
		dev-python/cryptography[${PYTHON_USEDEP}]
		dev-python/dateparser[${PYTHON_USEDEP}]
		dev-python/emoji[${PYTHON_USEDEP}]
		dev-python/keyring[${PYTHON_USEDEP}]
		dev-python/lxml[${PYTHON_USEDEP}]
		dev-python/natsort[${PYTHON_USEDEP}]
		dev-python/piexif[${PYTHON_USEDEP}]
		dev-python/pillow[${PYTHON_USEDEP}]
		dev-python/pure-protobuf[${PYTHON_USEDEP}]
		dev-python/pygobject[${PYTHON_USEDEP}]
		dev-python/python-magic[${PYTHON_USEDEP}]
		dev-python/rarfile[compressed,${PYTHON_USEDEP}]
		dev-python/requests[${PYTHON_USEDEP}]
		dev-python/unidecode[${PYTHON_USEDEP}]
	')
"
BDEPEND="
	dev-util/blueprint-compiler
	sys-devel/gettext
"

src_install() {
	meson_src_install
	python_optimize
	python_fix_shebang "${D}/usr/bin/komikku"
}

pkg_postinst() {
	gnome2_schemas_update
	xdg_pkg_postinst
}

pkg_postrm() {
	gnome2_schemas_update
	xdg_pkg_postrm
}
