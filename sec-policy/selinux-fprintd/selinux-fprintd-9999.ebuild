# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sec-policy/selinux-fprintd/selinux-fprintd-9999.ebuild,v 1.5 2015/03/22 13:47:25 swift Exp $
EAPI="5"

IUSE=""
MODS="fprintd"

inherit selinux-policy-2

DESCRIPTION="SELinux policy for fprintd"

if [[ $PV == 9999* ]] ; then
	KEYWORDS=""
else
	KEYWORDS="~amd64 ~x86"
fi
DEPEND="${DEPEND}
	sec-policy/selinux-dbus
"
RDEPEND="${RDEPEND}
	sec-policy/selinux-dbus
"
