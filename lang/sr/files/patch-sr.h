--- sr.h.orig	Sat Dec 13 19:53:57 2003
+++ sr.h	Sat Dec 13 19:56:14 2003
@@ -324,7 +324,7 @@
 extern Ptr	sr_astring();
 extern Array *	sr_aswap();
 extern int	sr_boolval();
-extern Ptr	sr_cat();
+extern Ptr	sr_cat(String *a, ...);
 extern Bool	sr_cap_ck();
 extern Array *	sr_chars();
 extern int	sr_charval();
@@ -363,10 +363,10 @@
 extern int	sr_get_string();
 extern Ptr	sr_gswap();
 extern void	sr_iaccess();
-extern int	sr_imax();
-extern int	sr_imin();
+extern int	sr_imax(int n, ...);
+extern int	sr_imin(int n, ...);
 extern int	sr_imod();
-extern Array *	sr_init_array();
+extern Array *	sr_init_array(char *locn, Array *addr, ...);
 extern void	sr_init_semop();
 extern int	sr_intval();
 extern Ptr	sr_invoke();
@@ -385,28 +385,28 @@
 extern Ocap	sr_new_op();
 extern int	sr_numargs();
 extern File	sr_open();
-extern void	sr_printf();
+extern void	sr_printf(char *locn, ...);
 extern Ptr	sr_ptrval();
 extern int	sr_query_iop();
 extern Real	sr_random();
-extern int	sr_read();
+extern int	sr_read(char *locn, ...);
 extern Real	sr_realval();
 extern Ptr	sr_receive();
 extern Bool	sr_remove();
 extern Invb	sr_reply();
 extern void	sr_rm_iop();
-extern Real	sr_rmax();
-extern Real	sr_rmin();
+extern Real	sr_rmax(int n, ...);
+extern Real	sr_rmin(int n, ...);
 extern Real	sr_rmod();
 extern Real	sr_round();
 extern Real	sr_rtoi();
 extern Real	sr_rtor();
-extern int	sr_runerr();
-extern int	sr_scanf();
+extern int	sr_runerr(char *locn, ...);
+extern int	sr_scanf(char *locn, ...);
 extern void	sr_seed();
 extern int	sr_seek();
 extern void	sr_setpri();
-extern Ptr	sr_slice();
+extern Ptr	sr_slice(char *locn, ...);
 extern Ptr	sr_sslice();
 extern String *	sr_sswap();
 extern void	sr_stop();
