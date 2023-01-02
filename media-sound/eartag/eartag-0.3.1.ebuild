# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..11} )
inherit python-single-r1 meson xdg

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/knuxify/eartag.git"
else
	SRC_URI="https://github.com/knuxify/eartag/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

DESCRIPTION="A simple music tag editor."
HOMEPAGE="https://github.com/knuxify/eartag"
LICENSE="MIT"
SLOT="0"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

DEPEND="
	>=gui-libs/gtk-4.8.0:4
	>=gui-libs/libadwaita-1.2.0
"
RDEPEND="
	${DEPEND}
	${PYTHON_DEPS}
	$(python_gen_cond_dep '
		dev-python/pillow[${PYTHON_USEDEP}]
		dev-python/pygobject[${PYTHON_USEDEP}]
		dev-python/python-magic[${PYTHON_USEDEP}]
		media-libs/mutagen[${PYTHON_USEDEP}]
	')
"
BDEPEND=""

src_install() {
	meson_install
	python_fix_shebang "${D}/usr/bin/eartag"
}
