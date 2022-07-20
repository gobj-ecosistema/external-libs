Hacks of External libraries
===========================

Para encontrar el código modificado, comparar los tar.gz originales con los de gines.tar.gz

Hackeo de libuv:
================

No me aceptaron al parche de añadir uv_accept(), así que me toca hackear libuv.

Despues de uv_accept():

libuv-?.?.?/include/uv.h
------------------------

UV_EXTERN int uv_not_accept(uv_stream_t* server);

libuv-?.?.?/src/unix/stream.c
-----------------------------

int uv_not_accept(uv_stream_t* server) {
  if (server->accepted_fd == -1)
    return -EAGAIN;
  uv__close(server->accepted_fd);
  server->accepted_fd = -1;
  return 0;
}

Hackeo de pcre2
===============
Hay que añadir a pcre2posix.h

    #pragma once    /* GMS */


Hackeo de ocilib
================

diff -r ocilib-4.4.1/include/ocilib.h ocilib-4.4.1.gines/include/ocilib.h
41d40
<
62a62
> #include <inttypes.h>
135c135
<   #define OCI_CHARSET_ANSI
---
>   #define OCI_CHARSET_WIDE

diff -r ocilib-4.4.1/src/date.c ocilib-4.4.1.gines/src/date.c
>
722c722,723
<     t.tm_isdst = -1;
---
>     //t.tm_isdst = -1;
>     t.tm_isdst = 0; // GMS
724c725,726
<     time = mktime(&t);
---
>     //time = mktime(&t);
>     time = timegm(&t); // GMS
763c765,766
<         ptm = localtime(&t);
---
>         //ptm = localtime(&t);
>         ptm = gmtime(&t); // GMS
diff -r ocilib-4.4.1/src/library.c ocilib-4.4.1.gines/src/library.c
696c696
<     }
---
>     }
1424,1429c1424,1436
<     OCI_STATUS = OCI_SUCCESSFUL(OCIEnvCreate(&OCILib.env, oci_mode,
<                                                (dvoid *) &OCILib,
<                                                OCI_MemAllocOracleClient,
<                                                OCI_MemReallocOracleClient,
<                                                OCI_MemFreeOracleClient,
<                                                (size_t) 0, (dvoid **) NULL));
---
>      OCI_STATUS = OCI_SUCCESSFUL(OCIEnvCreate(&OCILib.env, oci_mode,
>                                                 (dvoid *) &OCILib,
>                                                 0, // GMS!!! OCI_MemAllocOracleClient,
>                                                 0, // GMS!!! OCI_MemReallocOracleClient,
>                                                 0, // GMS!!! OCI_MemFreeOracleClient,
>                                                 (size_t) 0, (dvoid **) NULL));
>
> //     OCI_STATUS = OCI_SUCCESSFUL(OCIEnvCreate(&OCILib.env, oci_mode,
> //                                                (dvoid *) &OCILib,
> //                                                OCI_MemAllocOracleClient,
> //                                                OCI_MemReallocOracleClient,
> //                                                OCI_MemFreeOracleClient,
> //                                                (size_t) 0, (dvoid **) NULL));
1590c1597
<     {
---
>     {
diff -r ocilib-4.4.1/src/ocilib_defs.h ocilib-4.4.1.gines/src/ocilib_defs.h
91,92c91,94
<         #define OCI_VERSION_COMPILE OCI_UNKNOWN
<         #define OCI_VERSION_RUNTIME OCI_UNKNOWN
---
>          #define OCI_VERSION_COMPILE OCI_11_2    // GMS!!!
>          #define OCI_VERSION_RUNTIME OCI_11_2
>  //         #define OCI_VERSION_COMPILE OCI_UNKNOWN
>  //         #define OCI_VERSION_RUNTIME OCI_UNKNOWN
