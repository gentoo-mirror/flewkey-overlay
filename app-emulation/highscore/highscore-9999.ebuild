# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson xdg gnome2-utils

if [[ ${PV} != *9999* ]]; then
	SRC_URI="https://gitlab.gnome.org/World/highscore/-/archive/${PV}/${P}.tar.gz"
	KEYWORDS="~amd64"
else
	inherit git-r3
	EGIT_REPO_URI="https://gitlab.gnome.org/World/highscore.git"
fi

DESCRIPTION="Retro gaming application for GNOME"
HOMEPAGE="https://wiki.gnome.org/Apps/Games"
LICENSE="GPL-3"
SLOT="0"

DEPEND="
	app-misc/tracker:0/2.0
	dev-db/sqlite:3
	dev-libs/glib
	dev-libs/libmanette
	dev-libs/libxml2
	games-emulation/retro-gtk[vala]
	gnome-base/librsvg
	gui-libs/gtk:4
	media-libs/grilo[vala]
	net-libs/libsoup:2.4
"
RDEPEND="${DEPEND}"
BDEPEND=""

pkg_postinst() {
	xdg_pkg_postinst
	gnome2_schemas_update
}
