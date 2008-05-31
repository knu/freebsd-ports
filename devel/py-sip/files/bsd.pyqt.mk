BSD_PYQT_MK_VERSION=	20080504

PYQT_MAINTAINER=	danny@ricin.com

MASTER_SITE_RIVERBANK=	http://www.riverbankcomputing.com/static/Downloads/
MASTER_SITE_RICIN=	http://freebsd.ricin.com/ports/distfiles/

MASTER_SITES_SIP=	${MASTER_SITE_RIVERBANK}sip4/ ${MASTER_SITE_RICIN}
MASTER_SITES_PYQT3=	${MASTER_SITE_RIVERBANK}PyQt3/ ${MASTER_SITE_RICIN}
MASTER_SITES_PYQT4=	${MASTER_SITE_RIVERBANK}PyQt4/ ${MASTER_SITE_RICIN}
MASTER_SITES_PYKDE3=	${MASTER_SITE_RIVERBANK}PyKDE3/ ${MASTER_SITE_RICIN}
MASTER_SITES_PYKDE4=	${MASTER_SITE_RIVERBANK}PyKDE4/ ${MASTER_SITE_RICIN}
MASTER_SITES_QSCI1=	${MASTER_SITE_RIVERBANK}QScintilla1/ ${MASTER_SITE_RICIN}
MASTER_SITES_QSCI2=	${MASTER_SITE_RIVERBANK}QScintilla2/ ${MASTER_SITE_RICIN}

SIP_VERSION=		4.7.4
PYQT3_VERSION=		3.17.4
PYQT4_VERSION=		4.3.3
PYKDE3_VERSION=		3.16.1
PYKDE4_VERSION=		4.0.2-1
QSCI1_VERSION=		1.7.1
QSCI2_VERSION=		2.2

SIP_DISTNAME=		sip-${SIP_VERSION}
PYQT3_DISTNAME=		PyQt-x11-gpl-${PYQT3_VERSION}
PYQT4_DISTNAME=		PyQt-x11-gpl-${PYQT4_VERSION}
PYKDE3_DISTNAME=	PyKDE-${PYKDE3_VERSION}
PYKDE4_DISTNAME=	PyKDE4-${PYKDE4_VERSION}
QSCI1_DISTNAME=		QScintilla-1.71-gpl-${QSCI1_VERSION}
QSCI2_DISTNAME=		QScintilla-gpl-${QSCI2_VERSION}
