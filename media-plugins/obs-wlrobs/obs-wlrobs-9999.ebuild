# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

EHG_REPO_URI="https://hg.sr.ht/~scoopta/wlrobs"

inherit mercurial meson

DESCRIPTION="Allows screen capture on wlroots-based Wayland compositors"
HOMEPAGE="https://hg.sr.ht/~scoopta/wlrobs"
LICENSE="GPL-3"
SLOT="0"
IUSE="+dmabuf +scpy"

DEPEND="
	dev-libs/wayland
	media-video/obs-studio
	dmabuf? ( x11-libs/libdrm )
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
