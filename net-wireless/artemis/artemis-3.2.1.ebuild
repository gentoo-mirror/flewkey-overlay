# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit xdg

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/AresValley/Artemis.git"
else
	SRC_URI="https://github.com/AresValley/Artemis/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
	MY_PN="Artemis"
	MY_P="${MY_PN}-${PV}"
	S="${WORKDIR}/${MY_P}"
fi

DESCRIPTION="Radio Signals Recognition Manual"
HOMEPAGE="https://aresvalley.com/Artemis/"
LICENSE="GPL-3"
SLOT="0"

DEPEND=""
RDEPEND="
	dev-python/aiohttp
	dev-python/certifi
	dev-python/numpy
	dev-python/pandas
	>=dev-python/pygame-1.9.6
	dev-python/PyQt5
	dev-python/qtawesome
	dev-python/urllib3
"
BDEPEND=""

src_prepare() {
	default
	# Do not delete the Data directory
	sed -i 's/import remove/import remove, system/' "${S}/src/downloadtargetfactory.py" || die
	sed -i 's;rmtree(Constants.DATA_FOLDER.*;os.system("rm -rf "+Constants.DATA_FOLDER+"/*");' "${S}/src/downloadtargetfactory.py" || die
}

src_install() {
	dodir /opt
	cp -r "${S}/src" "${D}/opt/${PN}" || die

	# TODO: Submit PR to use XDG dirs
	touch "${D}/opt/${PN}/info.log" || die
	echo "{}" > "${D}/opt/${PN}/settings.json" || die
	keepdir "/opt/${PN}/Data"
	for target in info.log settings.json Data
	do
		chown root:users "${D}/opt/${PN}/${target}" || die
		chmod g+rw "${D}/opt/${PN}/${target}" || die
	done

	dodir /usr/share/applications
	dodir /usr/share/icons
	cp "${FILESDIR}/artemis.desktop" "${D}/usr/share/applications" || die
	cp "${S}/spec_files/Linux/artemis3.svg" "${D}/usr/share/icons" || die
	dobin "${FILESDIR}/artemis"
}
