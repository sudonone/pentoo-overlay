# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit subversion

DESCRIPTION="Installer for pentoo, based on the ncurses Arch Linux installer"
HOMEPAGE="http://gitorious.org/pentoo/pentoo-installer"
ESVN_REPO_URI="https://pentoo.googlecode.com/svn/${PN}/trunk"

LICENSE="GPL-3"
SLOT="0"
if [[ "${PV}" == "99999999" ]] ; then
	KEYWORDS=""
else
	KEYWORDS="amd64 x86"
	#bump here
	ESVN_REVISION="5586"
fi

IUSE=""

DEPEND="app-arch/xz-utils"
RDEPEND="dev-util/dialog
	|| ( sys-boot/grub:0
	     sys-boot/grub-static:0 )
	net-misc/rsync"

src_install() {
	dodir /usr/
	cp -R "${S}"/* "${ED}"/usr/ || die "Copy files failed"
	exeinto /root/Desktop/
	doexe share/applications/pentoo-installer.desktop
}
