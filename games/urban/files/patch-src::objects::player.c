--- src/objects/player.cc.orig	Wed Jun 23 21:28:13 1999
+++ src/objects/player.cc	Sun Jan 25 23:31:48 2004
@@ -29,6 +29,7 @@
     thomas.nyberg@usa.net				jonas_b@bitsmart.com
 *****************************************************************************/
 #include <stdlib.h>
+#include <string.h>
 #include <allegro.h>
 #include "object.h"
 #include "object2.h"
@@ -104,7 +105,7 @@
         {30, 31, 32, 33, 34, 35},
         {24, 25, 26, 27, 28, 29},
 //        {5}, {25}, {-1}, {1}},
-        {3}, {10}, {-1}, {1}, {1}, {-1}},
+        3, 10, -1, 1, 1, -1},
         /* Flame thrower*/
 /*	int walk_left[6];
         int walk_right[6];
@@ -121,7 +122,7 @@
 //        {12, 13, 14, 15, 16, 17},
         {42, 43, 44, 45, 46, 47},
         {36, 37, 38, 39, 40, 41},
-        {5}, {8}, {0}, {0}, {0}, {500}},
+        5, 8, 0, 0, 0, 500},
         /* IceMaker(tm)*/
         {{84, 85, 86, 87, 88, 89},
         {78, 79, 80, 81, 82, 83},
@@ -130,7 +131,7 @@
 //        {12, 13, 14, 15, 16, 17},
         {72, 73, 74, 75, 76, 77},
         {66, 67, 68, 69, 70, 71},
-        {5}, {8}, {0}, {0}, {0}, {500}},
+        5, 8, 0, 0, 0, 500},
 	/* Grenade launcher */
         {{102, 103, 104, 105, 106, 107},
         {96, 97, 98, 99, 100, 101},
@@ -139,7 +140,7 @@
         {126, 127, 128, 129, 130, 131},
         {120, 121, 122, 123, 124, 125},
 //        {5}, {25}, {-1}, {1}},
-        {3}, {60}, {0}, {0}, {1}, {32}},
+        3, 60, 0, 0, 1, 32},
 	/* Plasma Weapon */
         {{138, 139, 140, 141, 142, 143},
         {132, 133, 134, 135, 136, 137},
@@ -147,7 +148,7 @@
         {144, 145, 146, 147, 148, 149},
         {162, 163, 164, 165, 166, 167},
         {156, 157, 158, 159, 160, 161},
-        {3}, {5}, {0}, {0}, {0}, {100}},
+        3, 5, 0, 0, 0, 100},
         /* Minigun */
         {{174, 175, 176, 177, 178, 179},
         {168, 169, 170, 171, 172, 173},
@@ -155,7 +156,7 @@
         {180, 181, 182, 183, 184, 185},
         {198, 199, 200, 201, 202, 203},
         {192, 193, 194, 195, 196, 197},
-        {1}, {1}, {0}, {0}, {1}, {1000}},
+        1, 1, 0, 0, 1, 1000},
         /* Electric */
         {{210, 211, 212, 213, 214, 215},
         {204, 205, 206, 207, 208, 209},
@@ -163,7 +164,7 @@
         {216, 217, 218, 219, 220, 221},
         {234, 235, 236, 237, 238, 239},
         {228, 229, 230, 231, 232, 233},
-        {6}, {6}, {0}, {0}, {0}, {100}}
+        6, 6, 0, 0, 0, 100}
 };
 
 /*struct Weapon {
