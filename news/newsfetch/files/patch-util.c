--- util.c.orig	Wed Nov 19 19:01:47 2003
+++ util.c	Wed Nov 19 19:01:47 2003
@@ -61,15 +61,15 @@
 FILE *fp, *fp1, *fp2;
 char *tmp, buf[200], group[180], filterfile[100], procmailrcfile[100];
 int i,j;
-char *title="
-
-############### Generated by  Newsfetch ##############################
-# New version of Newsfetch is available from                         #
-#                                                                    #
-#        http://ulf.wep.net/newsfetch.html                           #
-# Feedback and Comments to Yusuf Motiwala <yusuf@scientist.com>      #
-######################################################################
-
+char *title="\n\
+\n\
+############### Generated by  Newsfetch ##############################\n\
+# New version of Newsfetch is available from                         #\n\
+#                                                                    #\n\
+#        http://ulf.wep.net/newsfetch.html                           #\n\
+# Feedback and Comments to Yusuf Motiwala <yusuf@scientist.com>      #\n\
+######################################################################\n\
+\n\
 ";								     
 
        	strcpy(filterfile,homedir);
