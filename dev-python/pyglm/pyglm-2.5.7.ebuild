# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{5..10} )
DISTUTILS_USE_SETUPTOOLS=bdepend

inherit distutils-r1

GLM_COMMIT="fcda03b54596adda543bcdccc6c1879e380c86a7"

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/Zuzu-Typ/PyGLM.git"
	EGIT_SUBMODULES=( glm )
else
	SRC_URI="
		https://github.com/Zuzu-Typ/PyGLM/archive/${PV}.tar.gz -> ${P}.tar.gz
		https://github.com/g-truc/glm/archive/${GLM_COMMIT}.tar.gz -> glm-${GLM_COMMIT}.tar.gz
	"
	KEYWORDS="~amd64"
	MY_PN="PyGLM"
	MY_P="${MY_PN}-${PV}"
	S="${WORKDIR}/${MY_P}"
fi

DESCRIPTION="Fast OpenGL Mathematics"
HOMEPAGE="https://github.com/Zuzu-Typ/PyGLM"
LICENSE="ZLIB"
SLOT="0"

RDEPEND=""
BDEPEND="media-libs/glm"

src_unpack() {
	# Unvendor GLM once the version is bumped past 0.9.9.8
	if [[ ${PV} == 9999 ]]; then
		git-r3_src_unpack
	else
		default
		rm -rf "${S}/glm" || die
		mv "${WORKDIR}/glm-${GLM_COMMIT}" "${S}/glm" || die
	fi
}
