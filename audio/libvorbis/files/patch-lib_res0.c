
$FreeBSD$

--- lib/res0.c.orig
+++ lib/res0.c
@@ -223,6 +223,20 @@
   for(j=0;j<acc;j++)
     if(info->booklist[j]>=ci->books)goto errout;
 
+  /* verify the phrasebook is not specifying an impossible or
+     inconsistent partitioning scheme. */
+  {
+    int entries = ci->book_param[info->groupbook]->entries;
+    int dim = ci->book_param[info->groupbook]->dim;
+    int partvals = 1;
+    while(dim>0){
+      partvals *= info->partitions;
+      if(partvals > entries) goto errout;
+      dim--;
+    }
+    if(partvals != entries) goto errout;
+  }
+
   return(info);
  errout:
   res0_free_info(info);
@@ -263,7 +277,7 @@
     }
   }
 
-  look->partvals=rint(pow((float)look->parts,(float)dim));
+  look->partvals=look->phrasebook->entries;
   look->stages=maxstage;
   look->decodemap=_ogg_malloc(look->partvals*sizeof(*look->decodemap));
   for(j=0;j<look->partvals;j++){
