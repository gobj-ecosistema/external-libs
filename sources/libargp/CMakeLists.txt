cmake_minimum_required(VERSION 3.11)
project(argp C)

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

#include_directories(src)
#file(GLOB_RECURSE SRC_LIST ${PROJECT_SOURCE_DIR}/src/*.*)

set (SRCS
    src/argp-ba.c
    src/argp-eexst.c
    src/argp-fmtstream.c
    src/argp-fs-xinl.c
    src/argp-help.c
    src/argp-parse.c
    src/argp-pin.c
    src/argp-pv.c
    src/argp-pvh.c
    src/getopt.c
    src/getopt_init.c
    src/getopt1.c
)
set (HDRS
    src/argp.h
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

add_library(argp ${SRCS} ${HDRS})

##############################################
#   System install
##############################################
install(FILES ${HDRS} DESTINATION ${INC_DEST_DIR})

install(
        TARGETS argp
        PERMISSIONS
        OWNER_READ OWNER_WRITE
        GROUP_READ GROUP_WRITE
        WORLD_READ
        DESTINATION ${LIB_DEST_DIR}
)
