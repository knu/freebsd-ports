--- src/in_flac.c.orig	Sat Jul 31 19:52:24 2004
+++ src/in_flac.c	Mon Oct 15 19:27:01 2007
@@ -45,9 +45,14 @@
 static int ices_flac_close (input_stream_t* self);
 
 /* -- FLAC callbacks -- */
+#if !defined(FLAC_API_VERSION_CURRENT) || FLAC_API_VERSION_CURRENT <= 7
+# define FLAC_BUFSIZE_TYPE unsigned
+#else
+# define FLAC_BUFSIZE_TYPE size_t
+#endif /* !FLAC_API_VERSION_CURRENT || FLAC_API_VERSION_CURRENT <= 7 */
 static FLAC__StreamDecoderReadStatus
 flac_read_cb(const FLAC__StreamDecoder* decoder, FLAC__byte buffer[],
-	     unsigned* bytes, void* client_data);
+	     FLAC_BUFSIZE_TYPE* bytes, void* client_data);
 static FLAC__StreamDecoderWriteStatus
 flac_write_cb(const FLAC__StreamDecoder* decoder, const FLAC__Frame* frame,
 	      const FLAC__int32* const buffer[], void* client_data);
@@ -76,10 +81,32 @@
     return -1;
   }
 
+#if !defined(FLAC_API_VERSION_CURRENT) || FLAC_API_VERSION_CURRENT <= 7
   FLAC__stream_decoder_set_read_callback(decoder, flac_read_cb);
   FLAC__stream_decoder_set_write_callback(decoder, flac_write_cb);
   FLAC__stream_decoder_set_metadata_callback(decoder, flac_metadata_cb);
   FLAC__stream_decoder_set_error_callback(decoder, flac_error_cb);
+  FLAC__stream_decoder_set_client_data(decoder, self);
+
+  switch (FLAC__stream_decoder_init(decoder)) {
+  case FLAC__STREAM_DECODER_SEARCH_FOR_METADATA:
+    break;
+  case FLAC__STREAM_DECODER_MEMORY_ALLOCATION_ERROR:
+    ices_log_error("Could not allocate memory during FLAC decoder init");
+    goto errDecoder;
+  default:
+    ices_log_error("Unexpected error during FLAC decoder init");
+    goto errDecoder;
+  }
+#else
+  if (FLAC__stream_decoder_init_stream(decoder, flac_read_cb, NULL, NULL, NULL,
+                                       NULL, flac_write_cb, flac_metadata_cb,
+                                       flac_error_cb, self)
+      != FLAC__STREAM_DECODER_INIT_STATUS_OK) {
+    ices_log_error("ices_flac_open: Error initializing FLAC decoder");
+    goto errDecoder;
+  }
+#endif /* !FLAC_API_VERSION_CURRENT || FLAC_API_VERSION_CURRENT <= 7 */
 
   FLAC__stream_decoder_set_metadata_respond(decoder, FLAC__METADATA_TYPE_VORBIS_COMMENT);
 
@@ -87,7 +114,6 @@
     ices_log_error ("Malloc failed in ices_flac_open");
     goto errDecoder;
   }
-  FLAC__stream_decoder_set_client_data(decoder, self);
 
   flac_data->decoder = decoder;
   flac_data->parsed = 0;
@@ -96,17 +122,6 @@
 
   self->data = flac_data;
 
-  switch (FLAC__stream_decoder_init(decoder)) {
-  case FLAC__STREAM_DECODER_SEARCH_FOR_METADATA:
-    break;
-  case FLAC__STREAM_DECODER_MEMORY_ALLOCATION_ERROR:
-    ices_log_error("Could not allocate memory during FLAC decoder init");
-    goto errData;
-  default:
-    ices_log_error("Unexpected error during FLAC decoder init");
-    goto errData;
-  }
-
   if (!FLAC__stream_decoder_process_single(decoder)) {
     ices_log_error("Could not find FLAC metadata header");
     free(flac_data);
@@ -179,7 +194,7 @@
 /* -- callbacks -- */
 static FLAC__StreamDecoderReadStatus
 flac_read_cb(const FLAC__StreamDecoder* decoder, FLAC__byte buffer[],
-	     unsigned* bytes, void* client_data)
+	     FLAC_BUFSIZE_TYPE* bytes, void* client_data)
 {
   input_stream_t* self = (input_stream_t*)client_data;
   flac_in_t* flac_data = (flac_in_t*)self->data;
