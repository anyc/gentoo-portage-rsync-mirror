# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-misc/wcd/wcd-5.2.7.ebuild,v 1.3 2015/06/26 09:04:16 ago Exp $

EAPI=5

inherit eutils toolchain-funcs

DESCRIPTION="Wherever Change Directory"
HOMEPAGE="http://waterlan.home.xs4all.nl/#WCD_ANCHOR"
SRC_URI="http://waterlan.home.xs4all.nl/${PN}/${P}.tar.gz"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="amd64 ~arm x86 ~amd64-linux ~x86-linux"
IUSE="nls unicode"

CDEPEND="
	sys-libs/ncurses[unicode?]
	unicode? ( dev-libs/libunistring )"
DEPEND="${CDEPEND}
	app-text/ghostscript-gpl"
RDEPEND="${CDEPEND}"

S="${WORKDIR}"/${P}/src

src_prepare() {
	epatch \
		"${FILESDIR}"/${PN}-5.2.5-gentoo.patch
	tc-export CC
}

src_compile() {
	local mycompile="LFS=1"
	use nls || mycompile="${mycompile} ENABLE_NLS="
	use unicode && mycompile="${mycompile} UCS=1 UNINORM=1"
	emake \
		${mycompile}
}

src_install() {
	local DOCS="../README.txt"
	default
	emake DESTDIR="${D}" DOTWCD=1 install-profile sysconfdir="/etc"
}
