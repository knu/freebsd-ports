--- texk/make/common.mk.orig	Mon Feb  9 19:09:33 2004
+++ texk/make/common.mk	Mon Feb  9 19:09:53 2004
@@ -49,7 +49,7 @@
 # Installation.
 INSTALL = @INSTALL@
 INSTALL_PROGRAM = @INSTALL_PROGRAM@
-INSTALL_SCRIPT = $(INSTALL_PROGRAM)
+INSTALL_SCRIPT = @INSTALL_SCRIPT@
 INSTALL_DATA = @INSTALL_DATA@
 INSTALL_LIBTOOL_LIBS = INSTALL_DATA='$(INSTALL_DATA)' $(LIBTOOL) install-lib
 INSTALL_LIBTOOL_PROG = INSTALL_PROGRAM='$(INSTALL_PROGRAM)' $(LIBTOOL) install-prog
