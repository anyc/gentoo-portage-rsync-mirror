# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-libs/mutagen/mutagen-1.27.ebuild,v 1.4 2015/07/03 10:20:33 ago Exp $

EAPI=5
PYTHON_COMPAT=( python{2_7,3_3,3_4} )

inherit distutils-r1

DESCRIPTION="Mutagen is an audio metadata tag reader and writer implemented in pure Python"
HOMEPAGE="http://code.google.com/p/mutagen http://pypi.python.org/pypi/mutagen"
SRC_URI="https://bitbucket.org/lazka/${PN}/downloads/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="alpha amd64 ~hppa ~ia64 ~ppc ~ppc64 ~sparc x86 ~x86-interix ~amd64-linux ~x86-linux"
IUSE="doc test"

# TODO: Missing support for >=dev-python/eyeD3-0.7 API
# test? ( >=dev-python/eyeD3-0.7 )
DEPEND="
	doc? ( dev-python/sphinx[${PYTHON_USEDEP}] )
"

python_compile_all() {
	use doc && emake -C docs
}

src_test() {
	# tests/test_flac.py uses temp files with a constant path.
	# If we had multiple python implementations, we would hit a race.
	DISTUTILS_NO_PARALLEL_BUILD=1 distutils-r1_src_test
}

python_test() {
	esetup.py test
}

python_install_all() {
	local DOCS=( NEWS README.rst )
	use doc && local HTML_DOCS=( docs/_build/. )
	distutils-r1_python_install_all
}
