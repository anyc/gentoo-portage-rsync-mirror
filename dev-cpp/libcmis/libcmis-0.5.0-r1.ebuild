# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-cpp/libcmis/libcmis-0.5.0-r1.ebuild,v 1.1 2015/05/16 21:13:10 dilfridge Exp $

EAPI=5

EGIT_REPO_URI="git://git.code.sf.net/p/libcmis/code"
[[ ${PV} == 9999 ]] && SCM_ECLASS="git-r3"
inherit eutils alternatives autotools ${SCM_ECLASS}
unset SCM_ECLASS

DESCRIPTION="C++ client library for the CMIS interface"
HOMEPAGE="https://sourceforge.net/projects/libcmis/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz http://dev.gentoo.org/~dilfridge/distfiles/${P}-gcc5.patch.gz"

LICENSE="|| ( GPL-2 LGPL-2 MPL-1.1 )"
SLOT="0.5"

# Don't move KEYWORDS on the previous line or ekeyword won't work # 399061
[[ ${PV} == 9999 ]] || \
KEYWORDS="~amd64 ~arm ~x86 ~amd64-linux ~x86-linux"

IUSE="static-libs man test"

RDEPEND="
	!dev-cpp/libcmis:0
	!dev-cpp/libcmis:0.2
	!dev-cpp/libcmis:0.3
	!dev-cpp/libcmis:0.4
	dev-libs/boost:=
	dev-libs/libxml2
	net-misc/curl
"
DEPEND="${RDEPEND}
	virtual/pkgconfig
	man? (
		app-text/docbook2X
		dev-libs/libxslt
	)
	test? (
		dev-util/cppcheck
		dev-util/cppunit
	)
"

src_prepare() {
	epatch "${WORKDIR}/${P}-gcc5.patch"
	eautoreconf
}

src_configure() {
	econf \
		--docdir="${EPREFIX}"/usr/share/doc/${PF} \
		--program-suffix=-${SLOT} \
		--disable-werror \
		$(use_with man) \
		$(use_enable static-libs static) \
		$(use_enable test tests) \
		--enable-client
}

src_install() {
	default
	prune_libtool_files --all
}

pkg_postinst() {
	alternatives_auto_makesym /usr/bin/cmis-client "/usr/bin/cmis-client-[0-9].[0-9]"
}

pkg_postrm() {
	alternatives_auto_makesym /usr/bin/cmis-client "/usr/bin/cmis-client-[0-9].[0-9]"
}
