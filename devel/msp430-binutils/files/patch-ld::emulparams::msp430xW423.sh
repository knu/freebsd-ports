--- /dev/null	Mon Aug 11 17:56:44 2003
+++ ld/emulparams/msp430xW423.sh	Mon Aug 11 17:56:07 2003
@@ -0,0 +1,14 @@
+ARCH=msp:42
+MACHINE=
+SCRIPT_NAME=elf32msp430
+OUTPUT_FORMAT="elf32-msp430"
+MAXPAGESIZE=1
+EMBEDDED=yes
+TEMPLATE_NAME=generic
+
+ROM_START=0xe000
+ROM_SIZE=0x1fe0
+RAM_START=0x0200
+RAM_SIZE=256
+
+STACK=0x300
