# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

EGIT_REPO_URI="https://github.com/grejppi/bitrot.git"
PYTHON_COMPAT=( python2_7 python3_4 python3_5 python3_6 )
PYTHON_REQ_USE="threads(+)"

inherit git-r3 python-any-r1 waf-utils

DESCRIPTION="Audio effect plugins (LV2, VST2, LADSPA) for glitch effects"
HOMEPAGE="https://github.com/grejppi/bitrot"
LICENSE="Apache-2.0"
SLOT="0"

DEPEND="${PYTHON_DEPS}"

src_install() {
	waf-utils_src_install
	mv "${D}/usr/lib" "${D}/usr/$(get_libdir)"
}
