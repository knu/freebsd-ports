--- Rules.make.orig	Wed Apr 30 11:42:37 2003
+++ Rules.make	Wed Apr 30 11:52:50 2003
@@ -4,42 +4,42 @@
 #
 #- Building ----------------------------------------------------------
 #--- Tell "make" how to get to PyMOL 
-PYMOL_PATH = /users/warren/pymol
+PYMOL_PATH = ${PREFIX}
 #---------------------------------------------------------------------
 #
 #- Dependencies ------------------------------------------------------
 #--- X-windows
-XLIB_DIR = -L/usr/X11R6/lib
-XINC_DIR = -I/usr/X11R6/include
+XLIB_DIR = -L${X11BASE}/lib
+XINC_DIR = -I${X11BASE}/include
 #--- Python
-PYTHON_EXE = $(PYMOL_PATH)/ext/bin/python
+PYTHON_EXE = $(PYMOL_PATH)/bin/python
 PYTHON_LIB =
 PYTHON_LIB_DIR = 
-PYTHON_INC_DIR = -I$(PYMOL_PATH)/ext/include/python2.1 \
-	-I$(PYMOL_PATH)/ext/include/python2.1/Numeric
+PYTHON_INC_DIR = -I$(PYMOL_PATH)/include/@PYTHON_VERSION@ \
+	-I$(PYMOL_PATH)/include/@PYTHON_VERSION@/Numeric
 #--- Other external dependencies
-EXT_INC_DIR = -I$(PYMOL_PATH)/ext/include
-EXT_LIB_DIR = -L$(PYMOL_PATH)/ext/lib
+EXT_INC_DIR = -I$(PYMOL_PATH)/include -I.
+EXT_LIB_DIR = -L$(PYMOL_PATH)/lib
 #---------------------------------------------------------------------
 #
-#- Build for LINUX as an importable module ---------------------------
+#- Build for FreeBSD as an importable module ---------------------------
 #--- System libraries
-LIBS = $(PYTHON_LIB) -lglut -lGL -lGLU -ldl -lpng -lXmu $(ZLIB) -lm
+LIBS = $(PYTHON_LIB) -lglut -lGL -lGLU -lpng -lXmu $(ZLIB) -lm
 #--- PyMOL configuration
 DEFS = -D_PYMOL_MODULE -D_PYMOL_NUMPY 
 #--- How we build shared libraries
 BUILD = -shared 
 #--- What are we trying to build?
-DEST = -o modules/pymol/_cmd.so
-#--- Gcc Options for Linux
-CCOPT1 = -march=i486 -D__i686__ -ffast-math -Wall -ansi -Wmissing-prototypes
+DEST = -o modules/_cmd.so
+#--- Gcc Options for FreeBSD
+CCOPT1 = #-march=i486 -D__i686__ -ffast-math -Wall -ansi -Wmissing-prototypes
 #--- libraries for PyOpenGL 
 PYOGL_LIB =  -lglut -lGL -lGLU -lXmu -lXi
 #---------------------------------------------------------------------
 #
 #- Choose One --------------------------------------------------------
 #--- GCC Optimized
-CCOPT2 = -O3 -funroll-loops -fomit-frame-pointer
+CCOPT2 = #-O3 -funroll-loops -fomit-frame-pointer
 #--- GCC Profiling
 #CCOPT2 = -pg -O3 -funroll-loops
 #--- Debugging
@@ -47,7 +47,7 @@
 #---------------------------------------------------------------------
 #
 #- Choose One --------------------------------------------------------
-#--- Workaround for XFree86/DRI linux dll problem for module build
+#--- Workaround for XFree86/DRI FreeBSD dll problem for module build
 BUGS = -D_DRI_WORKAROUND
 #---
 #BUGS =
@@ -69,18 +69,19 @@
 # No changes normally required below here
 #---------------------------------------------------------------------
 
-CC = cc
+override CC := ${CC}
 
 LIB_DIRS = $(EXT_LIB_DIR) $(PYTHON_LIB_DIR) $(XLIB_DIR)
 
 # Enable source files to find headers
 PYMOL_INC_DIRS = -I../layer0 -I../layer1 -I../layer2 \
-   -I../layer3 -I../layer4 -I../layer5 
+   -I../layer3 -I../layer4 -I../layer5 -I../modules/
 
 C_FLAGS = $(CCOPT1) $(CCOPT2) $(EXT_INC_DIR) $(PYTHON_INC_DIR) \
-   $(XINC_DIR) $(PNG) $(DEFS) $(BUGS)
+   $(XINC_DIR) $(PNG) $(DEFS) $(BUGS) $(PYMOL_INC_DIRS)
+
+override CFLAGS := $(C_FLAGS) ${CFLAGS}
 
-CFLAGS = $(C_FLAGS)
 
 
 
