--- event.hpp.orig	2007-08-02 14:11:31.000000000 +0200
+++ event.hpp	2007-08-02 14:11:45.000000000 +0200
@@ -74,7 +74,7 @@
         list<Event *>::iterator k;
         for (k = events.begin(); k != events.end(); ++k) {
             Event *e = *k;
-            printf(":: Event %d  0x%x\n", e->type, (unsigned int)(e->function));
+            printf(":: Event %d  0x%x\n", e->type, (unsigned intptr_t)(e->function));
         }
     }
 
