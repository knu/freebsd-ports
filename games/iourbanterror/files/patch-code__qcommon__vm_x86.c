--- ./code/qcommon/vm_x86.c.orig	2007-10-09 02:47:22.000000000 -0300
+++ ./code/qcommon/vm_x86.c	2008-03-04 10:45:08.000000000 -0300
@@ -36,7 +36,7 @@
 
 /* need this on NX enabled systems (i386 with PAE kernel or
  * noexec32=on x86_64) */
-#ifdef __linux__
+#ifdef __unix__
 #define VM_X86_MMAP
 #endif
 
@@ -1081,7 +1081,7 @@
 	// copy to an exact size buffer on the hunk
 	vm->codeLength = compiledOfs;
 #ifdef VM_X86_MMAP
-	vm->codeBase = mmap(NULL, compiledOfs, PROT_WRITE, MAP_SHARED|MAP_ANONYMOUS, -1, 0);
+	vm->codeBase = mmap(NULL, compiledOfs, PROT_WRITE, MAP_SHARED|MAP_ANON, -1, 0);
 	if(vm->codeBase == (void*)-1)
 		Com_Error(ERR_DROP, "VM_CompileX86: can't mmap memory");
 #elif _WIN32
