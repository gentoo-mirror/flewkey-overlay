# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson

if [[ ${PV} != *9999* ]]; then
	SRC_URI="https://gitlab.gnome.org/GNOME/retro-gtk/-/archive/${PV}/${P}.tar.gz"
	KEYWORDS="~amd64"
else
	inherit git-r3
	EGIT_REPO_URI="https://gitlab.gnome.org/GNOME/retro-gtk.git"
fi

DESCRIPTION="GTK libretro frontend"
HOMEPAGE="https://gnome.pages.gitlab.gnome.org/retro-gtk/"
LICENSE="GPL-3"
SLOT="0"
IUSE="vala introspection"
REQUIRED_USE="vala? ( introspection )"

DEPEND="
	dev-libs/glib
	gui-libs/gtk:4
	media-libs/libsamplerate
	media-sound/pulseaudio
	x11-libs/cairo
	introspection? ( dev-libs/gobject-introspection )
	vala? ( dev-lang/vala:* )
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local emesonargs=(
		$(meson_use introspection)
		$(meson_use vala vapi)
	)
	meson_src_configure
}
