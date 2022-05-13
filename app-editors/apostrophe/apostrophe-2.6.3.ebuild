# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..10} )
DISTUTILS_USE_SETUPTOOLS=bdepend

inherit distutils-r1 gnome2-utils meson xdg

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://gitlab.gnome.org/World/apostrophe.git"
else
	MY_P="${PN}-v${PV}"
	S="${WORKDIR}/${MY_P}"
	SRC_URI="https://gitlab.gnome.org/World/apostrophe/-/archive/v${PV}/${MY_P}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

DESCRIPTION="A distraction free Markdown editor"
HOMEPAGE="https://apps.gnome.org/app/org.gnome.gitlab.somas.Apostrophe/"
LICENSE="GPL-3"
SLOT="0"

DEPEND="
	app-text/gspell
	app-text/pandoc
	dev-libs/glib
	dev-libs/gobject-introspection
	>=gui-libs/libhandy-1.6.0
	net-libs/webkit-gtk[introspection]
	sys-devel/gettext
	x11-libs/gtk+:3[introspection]
"
RDEPEND="
	${DEPEND}
	dev-python/pycairo
	dev-python/pyenchant
	dev-python/pygobject
	dev-python/pypandoc
	dev-python/python-levenshtein
	dev-python/regex
"
BDEPEND=""

pkg_postinst() {
	xdg_pkg_postinst
	gnome2_schemas_update
}
