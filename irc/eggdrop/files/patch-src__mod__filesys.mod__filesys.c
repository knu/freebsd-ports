--- src/mod/filesys.mod/filesys.c.orig	Mon Jun  2 11:25:01 2003
+++ src/mod/filesys.mod/filesys.c	Mon Jun  2 11:25:46 2003
@@ -461,7 +461,7 @@
   if (at_limit(nick)) {
     char xxx[1024];
 
-    sprintf(xxx, "%d*%s%s", strlen(dccdir), dccdir, dir);
+    sprintf(xxx, "%lu*%s%s", strlen(dccdir), dccdir, dir);
     queue_file(xxx, fn, dcc[idx].nick, nick);
     dprintf(idx, "Queued: %s to %s\n", fn, nick);
     my_free(s);
