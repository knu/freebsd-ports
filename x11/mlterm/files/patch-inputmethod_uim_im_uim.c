--- inputmethod/uim/im_uim.c.orig	2008-05-07 21:49:29.000000000 +0900
+++ inputmethod/uim/im_uim.c	2008-05-07 21:51:50.000000000 +0900
@@ -35,6 +35,7 @@
 #include  <uim-helper.h>
 #include <uim-im-switcher.h>
 
+#include  <stdio.h>
 #include  <X11/keysym.h>	/* XK_xxx */
 #include  <kiklib/kik_mem.h>	/* malloc/alloca/free */
 #include  <kiklib/kik_str.h>	/* kik_str_alloca_dup kik_str_sep kik_snprintf*/
