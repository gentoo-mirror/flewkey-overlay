# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson xdg

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/NickvisionApps/Tagger.git"
else
	SRC_URI="https://github.com/NickvisionApps/Tagger/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

DESCRIPTION="A simple music tag editor."
HOMEPAGE="https://gitlab.gnome.org/knuxify/eartag"
LICENSE="GPL-3"
SLOT="0"

DEPEND="
	dev-cpp/curlpp
	dev-libs/jsoncpp
	>=gui-libs/gtk-4.8.0:4
	>=gui-libs/libadwaita-1.2.0
	media-libs/taglib
"
RDEPEND="${DEPEND}"
BDEPEND=""
