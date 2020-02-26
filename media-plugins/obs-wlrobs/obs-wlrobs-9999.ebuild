EAPI=7

inherit meson

if [[ ${PV} != *9999* ]]; then
	SRC_URI="https://files.2a03.party/~flewkey/distfiles/${P}.tar.gz"
	KEYWORDS="~amd64"
else
	inherit mercurial
	EHG_REPO_URI="https://hg.sr.ht/~scoopta/wlrobs"
fi

DESCRIPTION="Allows screen capture on wlroots-based Wayland compositors"
HOMEPAGE="https://hg.sr.ht/~scoopta/wlrobs"
LICENSE="GPL-3"
SLOT="0"
IUSE="dmabuf +scpy"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND="
	dev-libs/wayland
	media-video/obs-studio
	virtual/pkgconfig
	dev-util/meson
	dmabuf? (
		x11-libs/libdrm
		virtual/opengl
	)
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
	dodir ${install_path}
	cp "${S}-build/libwlrobs.so" "${D}/${install_path}/libwlrobs.so" || die "Failed to install"
}

