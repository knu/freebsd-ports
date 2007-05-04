--- Makefile.gnu.orig	Sun Mar 11 02:46:54 2007
+++ Makefile.gnu	Sun Mar 11 02:53:21 2007
@@ -4,27 +4,27 @@
 include Makefile.srcs
 
 # General configuration variables:
-CC = gcc
-CXX = g++
+CC ?= gcc
+CXX ?= g++
 AR = ar
 
-INCDIR = /usr/include
-INSTALLDIR = /usr/lib
+INCDIR = ${PREFIX}/include
+INSTALLDIR = ${PREFIX}/lib
 
 # Converts cr/lf to just lf
 DOS2UNIX = dos2unix
 
-COMPILERFLAGS = -O3 -fPIC
+COMPILERFLAGS := ${CFLAGS}
 LIBRARIES = -lstdc++
 
 MODULES = $(SRCS:.c=.o)
 MODULES := $(MODULES:.cpp=.o)
-CFLAGS = $(COMPILERFLAGS) $(INCLUDE)
-CXXFLAGS = $(COMPILERFLAGS)  -Wno-ctor-dtor-privacy $(INCLUDE)
+CFLAGS = $(COMPILERFLAGS) -fPIC $(INCLUDE)
+CXXFLAGS = $(COMPILERFLAGS)  -fPIC -Wno-ctor-dtor-privacy $(INCLUDE)
 
 TARGET  = freeimage
 STATICLIB = lib$(TARGET).a
-SHAREDLIB = lib$(TARGET)-$(VER_MAJOR).$(VER_MINOR).so
+SHAREDLIB = lib$(TARGET).so.$(VER_MAJOR)
 LIBNAME	= lib$(TARGET).so
 VERLIBNAME = $(LIBNAME).$(VER_MAJOR)
 HEADER = Source/FreeImage.h
@@ -37,7 +37,7 @@
 
 dist: FreeImage
 	cp *.a Dist
-	cp *.so Dist
+	cp *.so.* Dist
 	cp Source/FreeImage.h Dist
 
 dos2unix:
@@ -58,12 +58,11 @@
 	$(CC) -s -shared -Wl,-soname,$(VERLIBNAME) -o $@ $(MODULES) $(LIBRARIES)
 
 install:
-	install -m 644 -o root -g root $(HEADER) $(INCDIR)
-	install -m 644 -o root -g root $(STATICLIB) $(INSTALLDIR)
-	install -m 755 -o root -g root $(SHAREDLIB) $(INSTALLDIR)
+	install -m 644 -o root -g wheel $(HEADER) $(INCDIR)
+	install -m 644 -o root -g wheel $(STATICLIB) $(INSTALLDIR)
+	install -m 755 -o root -g wheel $(SHAREDLIB) $(INSTALLDIR)
 	ln -sf $(SHAREDLIB) $(INSTALLDIR)/$(VERLIBNAME)
-	ln -sf $(VERLIBNAME) $(INSTALLDIR)/$(LIBNAME)	
-	ldconfig
+	ln -sf $(VERLIBNAME) $(INSTALLDIR)/$(LIBNAME)
 
 clean:
 	rm -f core Dist/*.* u2dtmp* $(MODULES) $(STATICLIB) $(SHAREDLIB) $(LIBNAME)
