--- src/global.c.orig	Sun Nov  4 13:30:19 2001
+++ src/global.c	Sat Jan 26 22:15:50 2002
@@ -3096,7 +3096,7 @@
   global.allowed_ports = NULL;
 
   global.auto_save = NULL;
-  global.ping_command = l_strdup("/bin/ping -c 3 $IP");
+  global.ping_command = l_strdup("/sbin/ping -c 3 $IP");
 
   global.browse_width[0] = 369;
   global.browse_width[1] = 80;
