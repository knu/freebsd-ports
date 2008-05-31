--- ./texmaker.pro.orig	2008-04-23 17:30:45.000000000 +0400
+++ ./texmaker.pro	2008-05-26 22:12:38.000000000 +0400
@@ -161,16 +161,26 @@
 	utilities/fr_FR.dic \
 	utilities/AUTHORS \
 	utilities/COPYING \
-	utilities/CHANGELOG.txt \
-	utilities/texmaker16x16.png \
-	utilities/texmaker22x22.png \
-	utilities/texmaker32x32.png \
-	utilities/texmaker48x48.png \
-	utilities/texmaker64x64.png \
-	utilities/texmaker128x128.png \
-	utilities/texmaker.desktop \
-	utilities/texmaker.svg
+	utilities/CHANGELOG.txt
 INSTALLS += utilities
+icon16.path = $${PREFIX}/share/icons/hicolor/16x16/apps
+icon16.files= utilities/texmaker16x16.png
+icon22.path = $${PREFIX}/share/icons/hicolor/22x22/apps
+icon22.files= utilities/texmaker22x22.png
+icon32.path=  $${PREFIX}/share/icons/hicolor/32x32/apps
+icon32.files= utilities/texmaker32x32.png
+icon48.path=  $${PREFIX}/share/icons/hicolor/48x48/apps
+icon48.files=  utilities/texmaker48x48.png
+icon64.path=  $${PREFIX}/share/icons/hicolor/64x64/apps
+icon64.files= utilities/texmaker64x64.png
+icon128.path=  $${PREFIX}/share/icons/hicolor/128x128/apps
+icon128.files=utilities/texmaker128x128.png
+iconscale.path=$${PREFIX}/share/icons/hicolor/scalable/apps
+iconscale.files=utilities/texmaker.svg
+INSTALLS += icon16 icon22 icon32 icon48 icon64 icon128 iconscale
+desktop.path = $${PREFIX}/share/applications
+desktop.files= utilities/texmaker.desktop
+INSTALLS += desktop
 }
 ################################
 win32 {