# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..10} )
inherit python-single-r1 meson xdg gnome2-utils

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://gitlab.com/valos/Komikku.git"
else
	MY_PN="Komikku"
	MY_P="${MY_PN}-v${PV}"
	S="${WORKDIR}/${MY_P}"
	SRC_URI="https://gitlab.com/valos/Komikku/-/archive/v${PV}/${MY_P}.tar.bz2 -> ${P}.tar.bz2"
	KEYWORDS="~amd64"
fi

DESCRIPTION="A manga reading program"
HOMEPAGE="https://valos.gitlab.io/Komikku/"
LICENSE="GPL-3"
SLOT="0"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

DEPEND="
	>=gui-libs/gtk-4.8.1:4
	gui-libs/libadwaita
"
RDEPEND="
	${DEPEND}
	net-libs/webkit-gtk:5
	${PYTHON_DEPS}
	$(python_gen_cond_dep '
		dev-python/beautifulsoup4[${PYTHON_USEDEP}]
		dev-python/cloudscraper[${PYTHON_USEDEP}]
		dev-python/dateparser[${PYTHON_USEDEP}]
		dev-python/emoji[${PYTHON_USEDEP}]
		dev-python/keyring[${PYTHON_USEDEP}]
		dev-python/lxml[${PYTHON_USEDEP}]
		dev-python/natsort[${PYTHON_USEDEP}]
		dev-python/pillow[${PYTHON_USEDEP}]
		dev-python/pure-protobuf[${PYTHON_USEDEP}]
		dev-python/python-magic[${PYTHON_USEDEP}]
		dev-python/rarfile[${PYTHON_USEDEP}]
		dev-python/unidecode[${PYTHON_USEDEP}]
		dev-python/urllib3[brotli,${PYTHON_USEDEP}]
	')
"
BDEPEND=""

src_install() {
	meson_install
	python_optimize
	python_fix_shebang "${D}/usr/bin/komikku"
}

pkg_postinst() {
	xdg_icon_cache_update
	gnome2_schemas_update
}
