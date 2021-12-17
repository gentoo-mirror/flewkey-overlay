# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_9 )

inherit python-single-r1 meson xdg gnome2-utils

if [[ ${PV} != *9999* ]]; then
	MY_PN="Wike"
	MY_P="${MY_PN}-${PV}"
	S="${WORKDIR}/${MY_P}"
	SRC_URI="https://github.com/hugolabe/Wike/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
else
	inherit git-r3
	EGIT_REPO_URI="https://github.com/hugolabe/Wike.git"
fi

DESCRIPTION="Wikipedia reader for GNOME"
HOMEPAGE="https://github.com/hugolabe/Wike"
LICENSE="GPL-3"
SLOT="0"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="
	${PYTHON_DEPS}
	dev-python/pygobject
	dev-python/requests
"
BDEPEND=""

pkg_postinst() {
	xdg_icon_cache_update
	gnome2_schemas_update
}
