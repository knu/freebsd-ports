--- check/alc/test_wait_rx_sender.c.orig	Tue Jul 22 19:37:39 2003
+++ check/alc/test_wait_rx_sender.c	Wed Oct 15 17:09:33 2003
@@ -27,6 +27,9 @@
 #include <stdio.h>
 
 
+#ifdef FREEBSD
+#include <sys/types.h>
+#endif
 
 #ifdef WIN32
 #include <winsock2.h>
