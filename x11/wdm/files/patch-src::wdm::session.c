--- src/wdm/session.c.orig	Fri Jun  6 23:48:46 2003
+++ src/wdm/session.c	Tue Jul 22 20:32:23 2003
@@ -534,6 +534,7 @@
     int	pid;
 #ifdef HAS_SETUSERCONTEXT
     struct passwd* pwd;
+    extern char **environ;
 #endif
 #ifdef USE_PAM 
     pam_handle_t *pamh = thepamh();
@@ -613,6 +614,8 @@
 	 * Set the user's credentials: uid, gid, groups,
 	 * environment variables, resource limits, and umask.
 	 */
+        /* destroy user environment before calling setusercontext */
+	environ = verify->userEnviron;
 	pwd = getpwnam(name);
 	if (pwd)
 	{
@@ -622,6 +625,7 @@
 		    errno);
 		return (0);
 	    }
+            verify->userEnviron = environ;    
 	    endpwent();
 	}
 	else
