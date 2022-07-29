##############################################
#   CMake
#   En cmake options: -DCMAKE_INSTALL_PREFIX:PATH=c:/yuneta/development/output
##############################################
project(yuneta-all C)
cmake_minimum_required(VERSION 3.0)

##############################################
#   Source
##############################################
add_subdirectory(^gobj-ecosistema/rxspencer)
add_subdirectory(^gobj-ecosistema/ghelpers)
#add_subdirectory(^gobj-ecosistema/ginsfsm)
#add_subdirectory(^gobj-ecosistema/ytls)
#add_subdirectory(^gobj-ecosistema/timeranger)
#add_subdirectory(^yuneta/c-core)
#add_subdirectory(^yuneta/c-tls)
#add_subdirectory(^yuneta/yuno_agent)
#add_subdirectory(^yuneta/yuno_cli)
#add_subdirectory(^yunos)

# HACK Comment this subdirectories in case of error cause new api.
# add_subdirectory(^gobj-ecosistema/tests-g)
# add_subdirectory(^yuneta/tests-y)

# compile in Release mode optimized but adding debug symbols, useful for profiling :
#
#     cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo ..
#
# or compile with NO optimization and adding debug symbols :
#
#     cmake -DCMAKE_BUILD_TYPE=Debug ..
#
# Compilando para ARM poner cmake -DNOT_INCLUDE_LIBUNWIND
#
