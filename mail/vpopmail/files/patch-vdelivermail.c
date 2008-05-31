diff -urN -x .svn ../../vendor/vpopmail/vdelivermail.c ./vdelivermail.c
--- ../../vendor/vpopmail/vdelivermail.c	2007-10-07 23:44:14.000000000 +0300
+++ ./vdelivermail.c	2008-03-17 11:28:45.000000000 +0200
@@ -74,6 +74,7 @@
 int is_spam();
 #endif
 int  DeleteMail = 0;
+int  MoveMail = 0;
 int  local = 1;
 
 #define MSG_BUF_SIZE 5000
@@ -353,7 +354,6 @@
 
 int fdcopy (int write_fd, int read_fd, const char *extra_headers, size_t headerlen, char *address)
 {
-  char msgbuf[4096];
   ssize_t file_count;
   struct vlimits limits;
 #ifdef SPAMASSASSIN
@@ -393,7 +393,7 @@
             close(pim[1]);
             if (execl(SPAMC_PROG, SPAMC_PROG, "-f", "-u",
                  address, 0) == -1) {
-              while ((file_count = read(0, msgbuf, MSG_BUF_SIZE)) > 0) {
+              while ((file_count = read(0, msgbuf, sizeof(msgbuf))) > 0) {
                 write(1, msgbuf, file_count);
               }
               _exit(0);
@@ -421,18 +421,36 @@
     /* read it in chunks and write it to the new file */
     while ((file_count = read(read_fd, msgbuf, sizeof(msgbuf))) > 0) {
 #ifdef SPAMASSASSIN
-        if ( local==1 && InHeaders==1 &&
-             (limits.delete_spam==1 || vpw->pw_gid & DELETE_SPAM) ) {
-          printf("check is_spam\n");
-          if (is_spam(msgbuf) == 1) {
+        if ( local==1 && InHeaders==1
+#if defined(SPAM_THRESHOLD) || defined(SPAM_JUNKFOLDER)
+             ) {
+#else
+             && (limits.delete_spam==1 || vpw->pw_gid & DELETE_SPAM) ) {
+#endif
+          switch (is_spam(msgbuf, file_count)) {
+          case 2:
+#ifdef SPAM_THRESHOLD
             DeleteMail = 1;
             return(0);
+#endif
+          case 1:
+            if (limits.delete_spam==1 || vpw->pw_gid & DELETE_SPAM) {
+              DeleteMail = 1;
+              return(0);
+            }
+#ifdef SPAM_JUNKFOLDER
+            MoveMail = 1;
+#endif
           }
         }
 #endif
         if ( write(write_fd, msgbuf, file_count) == -1 ) return -1;
     }
-    
+#ifdef SPAMASSASSIN
+    /* No body */
+    if (InHeaders==1) DeleteMail = 1;
+#endif
+
     return 0;
 }
 
@@ -495,6 +513,11 @@
   size_t headerlen;
   int write_fd;
   char quota[80];
+#ifdef SPAM_JUNKFOLDER
+  struct stat mystatbuf;
+  char dir[MAX_BUFF];
+  char calling_dir[MAX_BUFF];
+#endif
 
     headerlen = strlen (extra_headers);
     msgsize += headerlen;
@@ -557,6 +580,24 @@
 	}
 
         /* if this succeeds link the file to the new directory */
+#ifdef SPAM_JUNKFOLDER
+        if (MoveMail == 1) {
+            snprintf(dir, sizeof(local_file_new), "%s/.Junk", maildir);
+            if (stat(dir, &mystatbuf) == -1) {
+                  /* record the dir where the vdelivermail command was run from */
+                  getcwd(calling_dir, sizeof(calling_dir));
+                  if (mkdir(dir,VPOPMAIL_DIR_MODE) == -1) { chdir(calling_dir); unlink(local_file_tmp); return(-2); }
+                  if (chdir(dir) == -1) { chdir(calling_dir); unlink(local_file_tmp); return(-2); }
+                  if (mkdir("cur",VPOPMAIL_DIR_MODE) == -1) { chdir(calling_dir); unlink(local_file_tmp); return(-2); }
+                  if (mkdir("new",VPOPMAIL_DIR_MODE) == -1) { chdir(calling_dir); unlink(local_file_tmp); return(-2); }
+                  if (mkdir("tmp",VPOPMAIL_DIR_MODE) == -1) { chdir(calling_dir); unlink(local_file_tmp); return(-2); }
+                  /* change back to the original dir */
+                  chdir(calling_dir);
+            }
+            snprintf(local_file_new, sizeof(local_file_new), "%s/.Junk/new/%lu.%lu.%.32s,S=%lu",
+                maildir, tm, pid, hostname, (long unsigned) msgsize);
+        }
+#endif
         if ( link( local_file_tmp, local_file_new ) == 0 ) {
             /* file was successfully delivered, remove temp file */
             if ( unlink(local_file_tmp) != 0 ) {
@@ -616,6 +657,9 @@
     /* rewind the message */
     lseek(0,0L,SEEK_SET);
 
+    /* reinitialize for each dot-qmail line */
+    DeleteMail = 0;
+
     /* This is an command */
     if ( *address == '|' ) { 
 
@@ -1207,19 +1251,22 @@
  *   * in the email headers for X-Spam-Level: which
  *    * we put in each spam email
  *     *
- *      * Return 1 if spam
+ *      * Return 2 if heavy spam
+ *      * Return 1 if light spam
  *       * Return 0 if not spam
  *        * Return -1 on error
  *         */
-int is_spam(char *spambuf)
+int is_spam(char *spambuf, int len)
 {
  int i,j,k;
  int found;
+ int spam = 0;
+ int rowlen;
 
-    for(i=0,j=0;spambuf[i]!=0;++i) {
+    for(i=0,j=0;i<len;++i) {
 
        /* found a line */
-       if (spambuf[i]=='\n' || spambuf[i]=='\r' ) {
+       if (spambuf[i]=='\n') {
 
          /* check for blank line, end of headers */
          for(k=j,found=0;k<i;++k) {
@@ -1242,13 +1289,19 @@
          }
          if ( found == 0 ) {
            InHeaders=0;
-           return(0);
+           return(spam);
          }
 
          /* still in the headers check for spam header */
-         if ( strncmp(&spambuf[j], "X-Spam-Flag: YES", 16 ) == 0 ) return(1);
+         rowlen = i - j;
+         if ( spam == 0 && rowlen == 16 && strncmp(&spambuf[j], "X-Spam-Flag: YES", 16 ) == 0 )
+           spam = 1;
+#ifdef SPAM_THRESHOLD
+         else if ( rowlen > 14 + SPAM_THRESHOLD && strncmp(&spambuf[j], "X-Spam-Level: ", 14 ) == 0 )
+	   return(2);
+#endif
 
-         if (spambuf[i+1]!=0) j=i+1;
+         j=i+1;
        }
      }
      return(0);
