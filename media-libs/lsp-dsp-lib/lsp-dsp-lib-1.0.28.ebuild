# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CLV="1.0.40" # LSP_COMMON_LIB_VERSION
CLN="lsp-common-lib" # LSP_COMMON_LIB_NAME
CLP="${CLN}-${CLV}"
TFV="1.0.29" # LSP_TEST_FW_VERSION
TFN="lsp-test-fw" # LSP_TEST_FW_NAME
TFP="${TFN}-${TFV}"

DESCRIPTION="Optimized DSP library"
HOMEPAGE="https://github.com/lsp-plugins/lsp-dsp-lib"

SRC_URI="
	https://github.com/lsp-plugins/lsp-dsp-lib/archive/${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/lsp-plugins/lsp-common-lib/archive/${CLV}.tar.gz -> ${CLP}.tar.gz
	https://github.com/lsp-plugins/lsp-test-fw/archive/${TFV}.tar.gz -> ${TFP}.tar.gz
"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64"

IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="${DEPEND}"

src_unpack() {
	default
	mkdir "${S}/modules" || die
	mv "${WORKDIR}/${CLP}" "${S}/modules/${CLN}" || die
	mv "${WORKDIR}/${TFP}" "${S}/modules/${TFN}" || die
}

src_configure() {
	emake config PREFIX="/usr" LIBDIR="/usr/$(get_libdir)" TEST=$(usex test 1 0)
}
