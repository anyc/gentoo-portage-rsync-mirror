# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-perl/Linux-Smaps/Linux-Smaps-0.130.0.ebuild,v 1.1 2015/07/11 20:22:19 dilfridge Exp $

EAPI=5

MODULE_AUTHOR=OPI
MODULE_VERSION=0.13
inherit perl-module linux-info

DESCRIPTION="Perl interface to /proc/PID/smaps"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

CONFIG_CHECK="~MMU ~PROC_PAGE_MONITOR"

SRC_TEST="do parallel"
