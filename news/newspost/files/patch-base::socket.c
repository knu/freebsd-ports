--- base/socket.c.orig	Tue Jan 18 11:08:02 2005
+++ base/socket.c	Tue Jan 18 11:10:08 2005
@@ -126,7 +126,7 @@
 
 	i = 0;
 	pi = buffer;
-	while (TRUE) {
+	while (read_count < STRING_BUFSIZE - 1) {
 		retval = read(sockfd, pi, 1);
 		if(retval < 0)
 			ui_socket_error(errno);
