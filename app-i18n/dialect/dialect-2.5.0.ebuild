# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..13} )

inherit python-single-r1 gnome2-utils meson xdg

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/dialect-app/dialect.git"
else
	SRC_URI="
		https://github.com/dialect-app/dialect/archive/${PV}.tar.gz -> ${P}.tar.gz
		https://github.com/dialect-app/po/archive/${PV}.tar.gz -> ${PN}-po-${PV}.tar.gz
	"
	KEYWORDS="~amd64"
fi

DESCRIPTION="A translation app for GNOME."
HOMEPAGE="https://dialectapp.org/"
LICENSE="GPL-3"
SLOT="0"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

DEPEND="
	app-crypt/libsecret
	gui-libs/gtk:4
	>=gui-libs/libadwaita-1.5.0:1
	media-libs/gstreamer
	>=net-libs/libsoup-3.0
"
RDEPEND="
	${DEPEND}
	${PYTHON_DEPS}
	$(python_gen_cond_dep '
		dev-python/beautifulsoup4[${PYTHON_USEDEP}]
		dev-python/dbus-python[${PYTHON_USEDEP}]
		dev-python/gtts[${PYTHON_USEDEP}]
		dev-python/pygobject[${PYTHON_USEDEP}]
	')
"

src_unpack() {
	if [[ ${PV} == 9999 ]]; then
		git-r3_src_unpack
	else
		default
		rm -rf "${S}/po" || die
		mv "${WORKDIR}/po-${PV}" "${S}/po" || die
	fi
}

src_install() {
	meson_src_install
	python_fix_shebang "${ED}/usr/bin/dialect"
}

pkg_postinst() {
	gnome2_schemas_update
	xdg_pkg_postinst
}

pkg_postrm() {
	gnome2_schemas_update
	xdg_pkg_postrm
}
