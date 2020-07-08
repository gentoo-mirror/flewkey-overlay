# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Epson Inkjet Printer Driver (ESC/P-R 2)"
HOMEPAGE="https://download.ebz.epson.net/dsc/du/02/DriverDownloadInfo.do?LG2=EN&CN2=&DSCMI=106340&DSCCHK=dfb754828eb21063e7b841aa0c98179893b615eb"
SRC_URI="https://files.2a03.party/~flewkey/distfiles/epson-inkjet-printer-escpr2-1.1.6.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="net-print/cups"
RDEPEND="${DEPEND}"

src_configure() {
	econf --disable-shared
	unset LC_ALL
	export LC_COLLATE=C
}

src_install() {
	emake -C ppd DESTDIR="${D}" install
	emake -C src DESTDIR="${D}" install
	einstalldocs
}

