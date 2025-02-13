# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
PYTHON_REQ_USE="threads(+)"

inherit git-r3 python-single-r1 waf-utils

DESCRIPTION="Audio effect plugins (LV2, VST2, LADSPA) for glitch effects"
HOMEPAGE="https://github.com/grejppi/bitrot"
SRC_URI="https://waf.io/waf-2.0.27"
EGIT_REPO_URI="https://github.com/grejppi/bitrot.git"

LICENSE="Apache-2.0"
SLOT="0"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="${PYTHON_DEPS}"

src_prepare() {
	default
	cp "${DISTDIR}/waf-2.0.27" "${WORKDIR}/${P}/waf" || die "Unable to update Waf"
	sed -i -e "s|\${{PREFIX}}/lib/|\${{PREFIX}}/$(get_libdir)/|" plugins/wscript || die
}
