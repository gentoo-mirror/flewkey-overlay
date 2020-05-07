EAPI=7

inherit qmake-utils xdg-utils

if [[ ${PV} != *9999* ]]; then
	SRC_URI="https://github.com/olive-editor/olive/archive/${PV}.tar.gz  -> ${P}.tar.gz"
	KEYWORDS="~amd64"
else
	inherit git-r3
	EGIT_REPO_URI="https://github.com/olive-editor/olive.git"
fi

DESCRIPTION="Olive Video Editor"
HOMEPAGE="https://olivevideoeditor.org/"
LICENSE="GPL-3"
SLOT="0"
IUSE="+frei0r"

DEPEND="
	dev-qt/qtcore:5
	dev-qt/qtmultimedia:5
	dev-qt/qtsvg:5
	media-video/ffmpeg
	frei0r? ( media-plugins/frei0r-plugins )
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	eqmake5 PREFIX="/usr"\
		DEFINES+=$(usex frei0r "" NOFREI0R)
}

src_install() {
	emake INSTALL_ROOT="${D}" install
}

pkg_postinst() {
	xdg_mimeinfo_database_update
	xdg_desktop_database_update
	xdg_icon_cache_update
}

pkg_postrm() {
	xdg_mimeinfo_database_update
	xdg_desktop_database_update
	xdg_icon_cache_update
}
