*** examples/icosahedronViewer/Viewer.cpp.orig	Sat Oct 29 15:58:21 2005
--- examples/icosahedronViewer/Viewer.cpp	Sat Oct 29 16:03:49 2005
***************
*** 46,52 ****
    scene.load(name);
    
    // QGLViewer settings.
!   setSceneBoundingBox(scene.getBBoxMin().f_data(), scene.getBBoxMax().f_data());
    showEntireScene();
  }
  
--- 46,55 ----
    scene.load(name);
    
    // QGLViewer settings.
!   setSceneBoundingBox(
!     qglviewer::Vec(scene.getBBoxMin()[0],scene.getBBoxMin()[1],scene.getBBoxMin()[2]), 
!     qglviewer::Vec(scene.getBBoxMax()[0],scene.getBBoxMax()[1],scene.getBBoxMax()[2])
!   );
    showEntireScene();
  }
  
