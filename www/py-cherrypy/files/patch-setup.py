--- setup.py	2008-01-13 22:38:39.000000000 +0100
+++ setup.py.port	2008-05-25 12:04:24.000000000 +0200
@@ -38,24 +38,39 @@
 cp_license="BSD"
 packages=[
     "cherrypy", "cherrypy.lib",
-    "cherrypy.tutorial", "cherrypy.test",
+    "cherrypy.test",
     "cherrypy.wsgiserver",
 ]
 download_url="http://download.cherrypy.org/cherrypy/3.0.3/"
 data_files=[
-    ('cherrypy/tutorial',
-        [
-            'cherrypy/tutorial/tutorial.conf',
-            'cherrypy/tutorial/README.txt',
-            'cherrypy/tutorial/pdf_file.pdf',
-            'cherrypy/tutorial/custom_error.html',
-        ]
-    ),
+
     ('cherrypy', ['cherrypy/favicon.ico',]),
     ('cherrypy/test', ['cherrypy/test/style.css',]),
     ('cherrypy/test/static', ['cherrypy/test/static/index.html',
                               'cherrypy/test/static/dirback.jpg',]),
 ]
+
+if not os.environ.has_key("NOPORTEXAMPLES"):
+    packages.append("cherrypy.tutorial")
+    data_files.append(
+	('cherrypy/tutorial',
+    	    [
+        	'cherrypy/tutorial/tutorial.conf',
+    	    ]
+	),
+    )
+
+if not os.environ.has_key("NOPORTDOCS"):
+    data_files.append(
+	('%%DOCSDIR%%',
+	    [
+        	'cherrypy/tutorial/README.txt',
+        	'cherrypy/tutorial/pdf_file.pdf',
+        	'cherrypy/tutorial/custom_error.html',
+	    ]
+	),
+    )
+
 ###############################################################################
 # end arguments for setup
 ###############################################################################
