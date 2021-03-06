# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-util/cwdiff/cwdiff-0.3.0.ebuild,v 1.2 2015/03/16 16:42:54 ottxor Exp $

EAPI=5

if [ "${PV}" = "9999" ]; then
	EGIT_REPO_URI="git://github.com/junghans/${PN}.git http://github.com/junghans/${PN}.git"
	inherit git-r3
	KEYWORDS=""
else
	SRC_URI="https://github.com/junghans/cwdiff/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~arm ~x86 ~amd64-linux ~x64-macos ~x86-macos"
fi

DESCRIPTION="A script that wraps wdiff to support directories and colorize the output"
HOMEPAGE="https://github.com/junghans/cwdiff"

LICENSE="GPL-2"
SLOT="0"
IUSE="a2ps mercurial"

DEPEND="sys-apps/help2man
	sys-apps/coreutils"
RDEPEND="
	sys-apps/sed
	app-shells/bash
	app-text/wdiff
	sys-apps/diffutils
	a2ps? ( app-text/a2ps )
	mercurial? ( dev-vcs/mercurial )
	"

src_install() {
	emake DESTDIR="${ED}" $(usex mercurial '' 'HGRCDIR=') install
	dodoc README.md
}
