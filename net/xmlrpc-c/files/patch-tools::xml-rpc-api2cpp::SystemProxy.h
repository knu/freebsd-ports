--- tools/xml-rpc-api2cpp/SystemProxy.h.orig	Mon Mar 26 08:49:56 2001
+++ tools/xml-rpc-api2cpp/SystemProxy.h	Tue Mar  2 23:39:39 2004
@@ -12,7 +12,7 @@
 public:
     SystemProxy (const XmlRpcClient& client)
         : mClient(client) {}
-    SystemProxy (const string& server_url)
+    SystemProxy (const std::string& server_url)
         : mClient(XmlRpcClient(server_url)) {}
     SystemProxy (const SystemProxy& o)
         : mClient(o.mClient) {}
@@ -29,13 +29,13 @@
        signatures. Each signature is an array of strings. The first item of
        each signature is the return type, and any others items are
        parameter types. */
-    XmlRpcValue /*array*/ methodSignature (string string1);
+    XmlRpcValue /*array*/ methodSignature (std::string string1);
 
     /* Given the name of a method, return a help string. */
-    string methodHelp (string string1);
+    std::string methodHelp (std::string string1);
 
     /* Process an array of calls, and return an array of results. Calls
-       should be structs of the form {'methodName': string, 'params':
+       should be structs of the form {'methodName': std::string, 'params':
        array}. Each result will either be a single-item array containg the
        result value, or a struct of the form {'faultCode': int,
        'faultString': string}. This is useful when you need to make lots of
