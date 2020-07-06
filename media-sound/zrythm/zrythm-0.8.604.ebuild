EAPI=7

inherit meson xdg-utils gnome2-utils

if [[ ${PV} != *9999* ]]; then
	SRC_URI="https://git.zrythm.org/cgit/zrythm/snapshot/${P}.tar.gz"
	KEYWORDS="~amd64"
else
	inherit git-r3
	EGIT_REPO_URI="https://git.zrythm.org/git/zrythm"
fi

DESCRIPTION="Zrythm is a digital audio workstation designed to be featureful and easy to use."
HOMEPAGE="https://www.zrythm.org/"
LICENSE="GPL-3"
SLOT="0"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND="
	app-arch/zstd
	dev-libs/libcyaml
	dev-scheme/guile
	kde-frameworks/breeze-icons
	media-libs/lilv
	media-libs/libaudec
	media-libs/chromaprint
	media-libs/rubberband
	sci-libs/fftw
	x11-libs/gtk+
	x11-libs/gtksourceview
"

src_install() {
	DESTDIR="${D}" eninja -C "${BUILD_DIR}" install
}

pkg_postinst() {
	xdg_mimeinfo_database_update
	xdg_desktop_database_update
	xdg_icon_cache_update
	gnome2_schemas_update
}

pkg_postrm() {
	xdg_mimeinfo_database_update
	xdg_desktop_database_update
	xdg_icon_cache_update
	gnome2_schemas_update
}
