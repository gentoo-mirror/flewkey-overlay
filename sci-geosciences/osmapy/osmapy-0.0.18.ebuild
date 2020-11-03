# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7,8} )
DISTUTILS_USE_SETUPTOOLS=rdepend

inherit distutils-r1

if [[ ${PV} != *9999* ]]; then
	SRC_URI="https://github.com/PhilippRigoll/osmapy/archive/${PV}.tar.gz  -> ${P}.tar.gz"
	#KEYWORDS="~amd64" Won't run from command line
else
	inherit git-r3
	EGIT_REPO_URI="https://github.com/PhilippRigoll/osmapy.git"
fi

DESCRIPTION="Python Editor for OpenStreetMap"
HOMEPAGE="https://wiki.openstreetmap.org/wiki/Osmapy"
LICENSE="GPL-3"
SLOT="0"

DEPEND="
	dev-python/cerberus
	python_targets_python3_6? ( dev-python/dataclasses )
	dev-python/easydict
	dev-python/gpxpy
	dev-python/lxml
	dev-python/numpy
	dev-python/pillow
	dev-python/pyside2
	dev-python/pyyaml
	dev-python/requests
	dev-python/setuptools
"
RDEPEND="${DEPEND}"
BDEPEND=""
