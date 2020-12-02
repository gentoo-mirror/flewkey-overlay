# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

SRC_URI="mirror://sourceforge/artha/${P}.tar.gz"
KEYWORDS="~amd64"

DESCRIPTION="Cross-platform offline English thesaurus using WordNet"
HOMEPAGE="http://artha.sourceforge.net/wiki/index.php/Home"
LICENSE="GPL-2"
SLOT="0"
IUSE="+spell libnotify"

DEPEND="
	>=app-dicts/wordnet-3.0
	>=dev-libs/dbus-glib-0.74
	>=dev-libs/glib-2.28
	x11-libs/gtk+:2
"
RDEPEND="
	${DEPEND}
	spell? ( >=app-text/enchant-2 )
	libnotify? ( x11-libs/libnotify )
"
BDEPEND="
	sys-devel/autoconf
	sys-devel/automake
"
