# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sys-devel/binutils/binutils-2.25.ebuild,v 1.4 2015/04/21 01:23:28 vapier Exp $

EAPI="4"

PATCHVER="1.1"
ELF2FLT_VER=""
inherit toolchain-binutils

KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~m68k ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86 ~amd64-fbsd -sparc-fbsd ~x86-fbsd"
