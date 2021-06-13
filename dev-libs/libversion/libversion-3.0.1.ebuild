# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

if [[ ${PV} != *9999* ]]; then
	SRC_URI="https://github.com/repology/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
else
	inherit git-r3
	EGIT_REPO_URI="https://github.com/repology/libversion.git"
fi

DESCRIPTION="Advanced version string comparison library"
HOMEPAGE="https://github.com/repology/libversion"
LICENSE="MIT"
SLOT="0"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	sed -i "s/LIBRARY DESTINATION lib/LIBRARY DESTINATION $(get_libdir)/" "${S}/libversion/CMakeLists.txt"
	sed -i "s/ARCHIVE DESTINATION lib/ARCHIVE DESTINATION $(get_libdir)/" "${S}/libversion/CMakeLists.txt"
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		"-DPKGCONFIGDIR=$(get_libdir)/pkgconfig"
	)
	cmake_src_configure
}
