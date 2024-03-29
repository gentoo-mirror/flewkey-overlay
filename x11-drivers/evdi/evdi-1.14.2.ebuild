# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit linux-mod-r1

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/DisplayLink/evdi.git"
else
	SRC_URI="https://github.com/DisplayLink/evdi/archive/v${PV}.tar.gz  -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

S="${S}/module"

DESCRIPTION="Kernel module for managing screens"
HOMEPAGE="https://github.com/DisplayLink/evdi"
LICENSE="GPL-2"
SLOT="0"

DEPEND="x11-libs/libdrm"
RDEPEND="${DEPEND}"
BDEPEND="sys-kernel/linux-headers"

CONFIG_CHECK="~FB_VIRTUAL ~I2C"

src_prepare() {
	default
	local KVER=$(cat "${KERNEL_DIR}/include/config/kernel.release")
	sed -i "1i KVER := ${KVER}" "${S}/Makefile"
}

src_compile() {
	local modlist=( evdi=video )
	linux-mod-r1_src_compile
}
