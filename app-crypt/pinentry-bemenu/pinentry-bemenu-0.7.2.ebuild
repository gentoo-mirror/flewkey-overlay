# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/t-8ch/pinentry-bemenu.git"
else
	SRC_URI="https://github.com/t-8ch/pinentry-bemenu/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

DESCRIPTION="Pinentry based on bemenu"
HOMEPAGE="https://github.com/t-8ch/pinentry-bemenu"
LICENSE="GPL-3"
SLOT="0"

DEPEND="
	dev-libs/bemenu
	dev-libs/libassuan
	dev-libs/libgpg-error
	dev-libs/popt
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	# Hardcode version
	sed -i '/#include "version.h"/d' "${S}/pinentry_bemenu.c"
	sed -i 's/PROJECT_NAME " " PROJECT_VERSION/PROJECT_NAME " v" PROJECT_VERSION/' "${S}/pinentry_bemenu.c"
	sed -i "/project(/a version : '${PV}'," "${S}/meson.build"
	sed -i '/vcs_tag/,+4d' "${S}/meson.build"
	sed -i "/conf_data.set_quoted(/a conf_data.set_quoted('PROJECT_VERSION', meson.project_version())" "${S}/meson.build"
}
