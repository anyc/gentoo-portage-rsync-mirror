# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-emacs/nxml-gentoo-schemas/nxml-gentoo-schemas-20150428.ebuild,v 1.1 2015/04/28 17:58:07 ulm Exp $

EAPI=5

inherit elisp

DESCRIPTION="Extension for nxml-mode with Gentoo-specific schemas"
HOMEPAGE="http://dev.gentoo.org/~flameeyes/nxml-gentoo-schemas/"
SRC_URI="http://dev.gentoo.org/~ulm/distfiles/${P}.tar.xz"

LICENSE="HPND"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86 ~x86-fbsd"

SITEFILE="60${PN}-gentoo.el"

src_compile() { :; }

src_install() {
	insinto "${SITEETC}/${PN}"
	doins schemas.xml *.rnc
	elisp-site-file-install "${FILESDIR}/${SITEFILE}"
	dodoc DONATING
}
