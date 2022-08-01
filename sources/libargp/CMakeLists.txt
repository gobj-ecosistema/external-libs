cmake_minimum_required(VERSION 3.0)
project(libargp C)

include(CheckIncludeFiles)
include(CheckSymbolExists)

set(CMAKE_INSTALL_PREFIX /yuneta/development/output)

set(INC_DEST_DIR ${CMAKE_INSTALL_PREFIX}/include)
set(LIB_DEST_DIR ${CMAKE_INSTALL_PREFIX}/lib)

if(LINUX)
    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall -std=c99")
endif()

IF(WIN32)
    add_definitions(-D_CRT_SECURE_NO_WARNINGS)
ENDIF(WIN32)

set(CMAKE_C_STANDARD 99)

set (SRCS
    argp-ba.c
    argp-eexst.c
    argp-fmtstream.c
    argp-fs-xinl.c
    argp-help.c
    argp-parse.c
    argp-pin.c
    argp-pv.c
    argp-pvh.c
    argp-xinl.c
    basename-lgpl.c
    dirname-lgpl.c
    stripslash.c
)
set (HDRS
#    argp-fmtstream.h
    argp.h
#    argp-namefrob.h
#    gettext.h
#    size_max.h
#    xsize.h
)

##############################################
#   Core lib
##############################################
OPTION(BUILD_STATIC_LIBS "Build static libraries." ON)
if (MSVC)
    # Turn off Microsofts "security" warnings.
    add_definitions( "/W3 /D_CRT_SECURE_NO_WARNINGS /wd4005 /wd4996 /nologo" )

    if (JANSSON_STATIC_CRT)
        set(CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE} /MT")
        set(CMAKE_C_FLAGS_DEBUG "${CMAKE_C_FLAGS_DEBUG} /MTd")
    endif()
endif()

add_library(libargp ${SRCS} ${HDRS})

##############################################
#   System install
##############################################
install(FILES ${HDRS} DESTINATION ${INC_DEST_DIR})

install(
        TARGETS libargp
        PERMISSIONS
        OWNER_READ OWNER_WRITE
        GROUP_READ GROUP_WRITE
        WORLD_READ
        DESTINATION ${LIB_DEST_DIR}
)
