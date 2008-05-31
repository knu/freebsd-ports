--- ioctl_stat.c.orig	Tue Feb  1 08:11:24 2000
+++ ioctl_stat.c	Mon Oct 18 22:32:49 2004
@@ -30,6 +30,12 @@
 #include <fcntl.h>		/* open */
 #include <sys/ioctl.h>		/* ioctl */
 #include <errno.h>
+#ifdef __FreeBSD__
+#include <sys/sysctl.h>
+#include <sys/socket.h>
+#include <net/if.h>
+#include <net/if_mib.h>
+#endif
 
 #ifndef STREAMS				/* Linux, FreeBSD, NetBSD, Ultrix */
 #	include <sys/socket.h>		/* socket */
@@ -63,6 +69,16 @@
 	struct ifreq ifr;
 	struct ifpppstatsreq req;
 	
+#ifdef __FreeBSD__
+	static int		if_ix = -1;
+	struct ifmibdata	ifmd;
+	size_t			ifmd_sz = sizeof(ifmd);
+	int			nr_ifs;
+	size_t			nr_ifs_sz = sizeof(nr_ifs);
+	int			name[6];
+	int			i;
+#endif
+
 	if (!ifd->s) getsocket(ifd);
 	
 	memset(&ifr, 0, sizeof(ifr));
@@ -84,18 +100,36 @@
 #define ifr_name ifr__name
 #endif	
 
-	strncpy(req.ifr_name, ifd->device, sizeof(req.ifr_name));
-	if (ioctl(ifd->s, SIOCGPPPSTATS, &req) != 0)
-	{
-		/* shouldn't fail if SIOCGIFFLAGS worked... */
-		ifd->in_bytes = 0UL;
-		ifd->out_bytes = 0UL;
-		return;
+#ifdef __FreeBSD__
+	name[0] = CTL_NET;
+	name[1] = PF_LINK;
+	name[2] = NETLINK_GENERIC;
+	name[3] = IFMIB_IFDATA;
+	name[5] = IFDATA_GENERAL;
+
+	if (if_ix < 0) {
+		if (sysctlbyname("net.link.generic.system.ifcount", (void *) &nr_ifs, &nr_ifs_sz, (void *) 0, 0) < 0) {
+			return;
+		}
+		for (i = 1; i <= nr_ifs; i++) {
+			name[4] = i; /* row of the ifmib table */
+
+			if (sysctl(name, 6, (void *) &ifmd, &ifmd_sz, (void *) 0, 0) < 0) {
+				continue;
+			}
+			if (strncmp(ifmd.ifmd_name, ifr.ifr_name, strlen(ifr.ifr_name)) == 0) {
+				if_ix = i;
+				break;
+			}
+		}
 	}
-	
-	ifd->in_bytes = (unsigned long)req.stats.p.ppp_ibytes;
-	ifd->out_bytes = (unsigned long)req.stats.p.ppp_obytes;
-	
+	name[4] = if_ix;
+	if (sysctl(name, 6, (void *) &ifmd, &ifmd_sz, (void *) 0, 0) >= 0) {
+		ifd->in_bytes = ifmd.ifmd_data.ifi_ibytes;
+		ifd->out_bytes = ifmd.ifmd_data.ifi_obytes;
+	}
+#endif
+
 	return;
 }
 
