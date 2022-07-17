##############################################
#   CMake
##############################################
project(argp C)
cmake_minimum_required(VERSION 3.0)
include(CheckIncludeFiles)
include(CheckSymbolExists)

set(CMAKE_INSTALL_PREFIX /yuneta/development/output)

set(INC_DEST_DIR ${CMAKE_INSTALL_PREFIX}/include)
set(LIB_DEST_DIR ${CMAKE_INSTALL_PREFIX}/lib)

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall -std=c99")

if(CYGWIN)
    add_definitions(-D__CYGWIN__)
endif()

if(CMAKE_BUILD_TYPE MATCHES Debug)
  add_definitions(-DDEBUG)
  option(SHOWNOTES "Show preprocessor notes" OFF)

  if(CMAKE_COMPILER_IS_GNUCC)
    # GCC specific debug options
    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -O0 -g3 -ggdb3 -gdwarf-2")
    set(AVOID_VERSION -avoid-version)
  endif(CMAKE_COMPILER_IS_GNUCC)
endif(CMAKE_BUILD_TYPE MATCHES Debug)

add_definitions(-D_GNU_SOURCE)
add_definitions(-D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64)

include_directories(/yuneta/development/output/include)

##############################################
#   Source
##############################################

set (SRCS
    # GObj core, by order of dependency
    src/argp-fmtstream.c
    src/argp-help.c
    src/argp-parse.c
    src/basename-lgpl.c
    src/dirname-lgpl.c
    src/getopt.c
    src/getopt1.c
    src/stripslash.c
)


set (HDRS
    src/argp.h
)

##############################################
#   Lib
##############################################
add_library(argp ${SRCS} ${HDRS})
set_target_properties(argp
    PROPERTIES COMPILE_DEFINITIONS "__SECURITY_AMICABLE_LEVEL__=1"
)


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
