--- skkserv/skkserv.h.orig	1997-01-20 20:16:36.000000000 +0100
+++ skkserv/skkserv.h	2008-01-01 19:58:41.000000000 +0100
@@ -37,6 +37,8 @@
 /* Necessary for SunOS 3.x and maybe other old systems */
 
 #include	<stdio.h>
+#include	<stdlib.h>
+#include	<string.h>
 
 #include	<sys/types.h>
 #ifdef HAVE_SYS_IOCTL_H
@@ -44,6 +46,7 @@
 #endif
 #include	<sys/socket.h>
 #include	<netinet/in.h>
+#include	<arpa/inet.h>
 #include	<netdb.h>
 #include	<signal.h>
 #include	<errno.h>
