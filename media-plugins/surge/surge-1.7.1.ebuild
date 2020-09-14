# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3 cmake

EGIT_REPO_URI="https://github.com/surge-synthesizer/surge.git"

if [[ ${PV} != *9999* ]]; then
	EGIT_COMMIT="release_${PV}" # The alternative is gluing together six tarballs
	KEYWORDS="~amd64"
fi

DESCRIPTION="Open source synthesizer plug-in"
HOMEPAGE="https://surge-synthesizer.github.io/"
LICENSE="GPL-3"
SLOT="0"
IUSE="+lv2 +vst3 headless" # The VST2 SDK is only available to licensed developers

DEPEND="
	x11-libs/cairo
	x11-libs/libxcb
	x11-libs/libxkbcommon[X]
	x11-libs/xcb-util-cursor
	x11-libs/xcb-util-keysyms
"
RDEPEND="${DEPEND}"
BDEPEND=""
PATCHES=(
	"${FILESDIR}/fix_stack.patch"
	"${FILESDIR}/prevent_stripping.patch"
)

src_compile() {
	use lv2 && cmake_build Surge-LV2-Packaged
	use vst3 && cmake_build Surge-VST3-Packaged
	use headless && cmake_build surge-headless
}

src_install() {
	dodir /usr/share
	cp -r "${S}/resources/data" "${D}/usr/share/surge" || die "Failed to install"
	if use lv2; then
		dodir /usr/$(get_libdir)/lv2
		cp -r "${BUILD_DIR}/surge_products/Surge.lv2" "${D}/usr/$(get_libdir)/lv2" || die "Failed to install"
	fi
	if use vst3; then
		dodir /usr/$(get_libdir)/vst3
		cp -r "${BUILD_DIR}/surge_products/Surge.vst3" "${D}/usr/$(get_libdir)/vst3" || die "Failed to install"
	fi
	if use headless; then
		dodir /usr/bin
		dobin "${BUILD_DIR}/surge-headless"
	fi
}
