--- agent/mibgroup/hardware/memory/memory_freebsd.c.orig	2006-03-06 17:23:52.000000000 +0100
+++ agent/mibgroup/hardware/memory/memory_freebsd.c	2008-04-14 16:45:19.000000000 +0200
@@ -47,6 +47,9 @@
     int            phys_mem_mib[] = { CTL_HW, HW_PHYSMEM };
     int            user_mem_mib[] = { CTL_HW, HW_USERMEM };
 
+    long            bufspace;
+
+
     /*
      * Retrieve the memory information from the underlying O/S...
      */
@@ -54,6 +57,7 @@
     sysctl(phys_mem_mib, 2, &phys_mem, &mem_size,      NULL, 0);
     sysctl(user_mem_mib, 2, &user_mem, &mem_size,      NULL, 0);
     auto_nlist(SUM_SYMBOL,      (char *) &vmem,     sizeof(vmem));
+    auto_nlist(BUFSPACE_SYMBOL, (char *) &bufspace, sizeof(bufspace));
 #ifndef freebsd4
     pagesize = 1024;
 #else
@@ -129,6 +133,18 @@
         mem->free  = -1;
     }
 
+    mem = netsnmp_memory_get_byIdx( NETSNMP_MEM_TYPE_MBUF, 1 );
+    if (!mem) {
+        snmp_log_perror("No Memory Buffer info entry");
+    } else {
+        if (!mem->descr)
+             mem->descr = strdup("Memory Buffer");
+        mem->units = pagesize;
+        mem->size  = bufspace/pagesize;
+        mem->free  = -1;
+    }
+
+
     nswap = swapmode(pagesize);
     mem = netsnmp_memory_get_byIdx( NETSNMP_MEM_TYPE_SWAP, 1 );
     if (!mem) {
