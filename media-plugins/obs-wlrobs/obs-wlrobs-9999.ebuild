# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

EHG_REPO_URI="https://hg.sr.ht/~scoopta/wlrobs"

inherit mercurial meson

DESCRIPTION="Allows screen capture on wlroots-based Wayland compositors"
HOMEPAGE="https://hg.sr.ht/~scoopta/wlrobs"
LICENSE="GPL-3"
SLOT="0"
IUSE="dmabuf +scpy"

DEPEND="
	dev-libs/wayland
	media-video/obs-studio
	dmabuf? (
		x11-libs/libdrm
		virtual/opengl
	)
"
RDEPEND="${DEPEND}"
BDEPEND="
	virtual/pkgconfig
	dev-util/meson
"

src_configure() {
	local emesonargs=(
		$(meson_use dmabuf use_dmabuf)
		$(meson_use scpy use_scpy)
	)
	meson_src_configure
}

src_install() {
	local install_path="/usr/lib/obs-plugins/"
	if $(uname -m | grep "64"); then
		install_path="/usr/lib64/obs-plugins/"
	fi
	dodir "/usr/$(get_libdir)/obs-plugins"
	cp "${S}-build/libwlrobs.so" "${D}/usr/$(get_libdir)/obs-plugins/libwlrobs.so" || die "Failed to install"
}
