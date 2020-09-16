# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

EGIT_REPO_URI="https://github.com/x42/tuna.lv2.git"

inherit git-r3

DESCRIPTION="Musical Instrument Tuner"
HOMEPAGE="http://x42-plugins.com/x42/x42-tuner"
LICENSE="GPL-2"
SLOT="0"

DEPEND="
	media-libs/lv2
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_compile() {
	emake STRIP="true" # Disable stripping
}

src_install() {
	emake DESTDIR="${D}" PREFIX="/usr" LV2DIR="/usr/$(get_libdir)/lv2" install
}
