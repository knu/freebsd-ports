--- ./classes/src/ArtsPortTableData.cc.orig	Mon Oct  2 13:05:28 2000
+++ ./classes/src/ArtsPortTableData.cc	Wed Sep 25 16:38:10 2002
@@ -182,7 +182,7 @@
 //.........................................................................
 //  
 //-------------------------------------------------------------------------
-uint32_t ArtsPortTableData::ComputeLength(uint8_t version = 0) const
+uint32_t ArtsPortTableData::ComputeLength(uint8_t version) const
 {
   this->_length = 0;
   
@@ -205,7 +205,7 @@
 //.........................................................................
 //  
 //-------------------------------------------------------------------------
-uint32_t ArtsPortTableData::Length(uint8_t version = 0) const
+uint32_t ArtsPortTableData::Length(uint8_t version) const
 {
   this->ComputeLength(version);
   return(this->_length);
@@ -216,7 +216,7 @@
 //.........................................................................
 //  
 //-------------------------------------------------------------------------
-istream& ArtsPortTableData::read(istream& is, uint8_t version = 0)
+istream& ArtsPortTableData::read(istream& is, uint8_t version)
 {
   uint32_t            numPorts;
   uint32_t            portNum;
@@ -239,7 +239,7 @@
 //.........................................................................
 //  
 //-------------------------------------------------------------------------
-int ArtsPortTableData::read(int fd, uint8_t version = 0)
+int ArtsPortTableData::read(int fd, uint8_t version)
 {
   uint32_t            numPorts;
   uint32_t            portNum;
@@ -281,7 +281,7 @@
 //  
 //-------------------------------------------------------------------------
 ostream& ArtsPortTableData::write(ostream& os,
-                                  uint8_t version = 0) const
+                                  uint8_t version) const
 {
   uint32_t                                    numPorts;
   vector<ArtsPortTableEntry>::const_iterator  portEntry;
@@ -305,7 +305,7 @@
 //.........................................................................
 //  
 //-------------------------------------------------------------------------
-int ArtsPortTableData::write(int fd, uint8_t version = 0) const
+int ArtsPortTableData::write(int fd, uint8_t version) const
 {
   uint32_t      numPorts;
   int           rc;
