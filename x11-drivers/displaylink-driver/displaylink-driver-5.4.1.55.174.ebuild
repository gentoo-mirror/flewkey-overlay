# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

AR_DATE="2021-09"
AR_NAME="DisplayLink%20USB%20Graphics%20Software%20for%20Ubuntu5.4.1-EXE.zip"
UBUNTU_VER="1604"

MY_PV=$(ver_rs 3 '-')
MY_P="${PN}-${MY_PV}"
S="${WORKDIR}/${MY_P}"

SRC_URI="https://www.synaptics.com/sites/default/files/exe_files/${AR_DATE}/${AR_NAME} -> ${P}.zip"
KEYWORDS="~amd64"

DESCRIPTION="Driver for modern DisplayLink devices"
HOMEPAGE="http://www.displaylink.com/downloads/ubuntu"
LICENSE="DisplayLink-EULA"
SLOT="0"

DEPEND="app-arch/unzip"
RDEPEND="
	virtual/libusb
	x11-libs/libevdi
"

QA_PREBUILT="opt/${P}/DisplayLinkManager"

src_unpack() {
	default
	sh "${WORKDIR}/${MY_P}.run" --noexec --keep
	cp "${FILESDIR}/dlm.init.d" "${WORKDIR}/dlm.init.d"
}

src_prepare() {
	default
	sed -i "s/@P@/${P}/" "${WORKDIR}/dlm.init.d"
}

src_install() {
	exeinto "/opt/${P}"
	insinto "/opt/${P}"
	case "${ARCH}" in
		amd64)	MY_ARCH="x64" ;;
		*)		MY_ARCH="${ARCH}" ;;
	esac
	ARCH_DIR="${S}/${MY_ARCH}-ubuntu-${UBUNTU_VER}"
	doexe "${ARCH_DIR}/DisplayLinkManager"
	doins "${S}/ella-dock-release.spkg"
	doins "${S}/firefly-monitor-release.spkg"
	doins "${S}/ridge-dock-release.spkg"
	newinitd "${WORKDIR}/dlm.init.d" "dlm"
}
