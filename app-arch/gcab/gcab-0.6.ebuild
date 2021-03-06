# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-arch/gcab/gcab-0.6.ebuild,v 1.2 2015/07/15 05:22:29 jer Exp $

EAPI=5

GCONF_DEBUG=no
VALA_USE_DEPEND=vapigen

inherit gnome2 vala

DESCRIPTION="Library and tool for working with Microsoft Cabinet (CAB) files"
HOMEPAGE="https://wiki.gnome.org/msitools"

LICENSE="LGPL-2.1+"
SLOT="0"
KEYWORDS="~amd64 ~hppa ~x86"
IUSE="+introspection vala"
REQUIRED_USE="vala? ( introspection )"

RDEPEND="
	>=dev-libs/glib-2.22:2
	sys-libs/zlib
	introspection? ( >=dev-libs/gobject-introspection-0.9.4 )
"
DEPEND="${RDEPEND}
	>=dev-util/gtk-doc-am-1.14
	>=dev-util/intltool-0.40
	sys-devel/gettext
	virtual/pkgconfig
	vala? ( $(vala_depend) )
"

src_prepare() {
	gnome2_src_prepare
	use vala && vala_src_prepare
}

src_configure() {
	local myconf
	use vala || myconf="VAPIGEN=no"
	gnome2_src_configure \
		--disable-static \
		$(use_enable introspection) \
		${myconf}
}
