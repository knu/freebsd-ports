--- MF3D/mftextrd.c.orig	2007-12-17 19:30:49.000000000 +0100
+++ MF3D/mftextrd.c	2007-12-17 19:32:02.000000000 +0100
@@ -178,7 +178,7 @@
 			MFASSERT(numNewLabels >= 0);
 
 			if (numNewLabels > 0)
-				result = MF3D_Reallocate(&tocLabelNames,
+				result = MF3D_Reallocate((void **)&tocLabelNames,
 						(numLabels + numNewLabels) * sizeof(*tocLabelNames));
 		}
 
@@ -250,7 +250,7 @@
 			if (result != kMF3DNoErr)
 				break;
 
-			result = MF3D_Reallocate(&objLabelName, labelLen);
+			result = MF3D_Reallocate((void **)&objLabelName, labelLen);
 			if (result != kMF3DNoErr)
 				break;
 
@@ -381,7 +381,7 @@
 			char			objName[kMF3D_MaxObjNameLength + 1];
 
 			if (numObjects % kMF3D_ObjTableChunk == 0)
-			{	result = MF3D_Reallocate(&objTable,
+			{	result = MF3D_Reallocate((void **)&objTable,
 						(numObjects + kMF3D_ObjTableChunk) * sizeof(*objTable));
 				if (result != kMF3DNoErr)
 					goto PreprocessTextFileAbort;
@@ -419,7 +419,7 @@
 					{	/* We found a TOC object. We will want to find
 						 * this later; so save the index.
 						 */
-						result = MF3D_Reallocate(&tocLocations,
+						result = MF3D_Reallocate((void **)&tocLocations,
 								(numTocs + 1) * sizeof(*tocLocations));
 						if (result != kMF3DNoErr)
 							goto PreprocessTextFileAbort;
@@ -499,7 +499,7 @@
 
 	/* Readjust the object table from its chunky size */
 	if (result == kMF3DNoErr)
-	{	result = MF3D_Reallocate(&objTable, (numObjects + 1) * sizeof(*objTable));
+	{	result = MF3D_Reallocate((void **)&objTable, (numObjects + 1) * sizeof(*objTable));
 		if (result == kMF3DNoErr)
 		{	/* Store the file length here */
 			AssignInt64(objTable[numObjects].objLocation, location);
@@ -1027,7 +1027,7 @@
 
 	result = kMF3DNoErr;
 	if ((ioStringPtr->pos % kMF3D_StringBufferChunk) == 0)
-		result = MF3D_Reallocate(&ioStringPtr->str,
+		result = MF3D_Reallocate((void **)&ioStringPtr->str,
 				ioStringPtr->pos + kMF3D_StringBufferChunk);
 
 	if (result == kMF3DNoErr)
