--- src/eggdrop.h.orig	Mon Jun  2 11:39:45 2003
+++ src/eggdrop.h	Mon Jun  2 11:40:17 2003
@@ -77,7 +77,7 @@
 /* Language stuff */
-#define LANGDIR  "./language" /* language file directory                   */
+#define LANGDIR  __PREFIX__ "/share/eggdrop/language" /* language file directory */
 #define BASELANG "english"    /* language which always gets loaded before
                                  all other languages. You do not want to
                                  change this.                              */
