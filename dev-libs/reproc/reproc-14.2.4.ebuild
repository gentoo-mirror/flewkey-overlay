# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/DaanDeMeyer/reproc.git"
else
	SRC_URI="https://github.com/DaanDeMeyer/reproc/archive/v${PV}.tar.gz  -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

DESCRIPTION="A library for dealing with external processes"
HOMEPAGE="https://github.com/DaanDeMeyer/reproc/"
LICENSE="MIT"
SLOT="0"

RDEPEND="${DEPEND}"
BDEPEND=">=dev-build/cmake-3.12"
