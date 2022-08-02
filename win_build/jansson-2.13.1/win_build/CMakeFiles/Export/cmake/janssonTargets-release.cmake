#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "jansson::jansson" for configuration "Release"
set_property(TARGET jansson::jansson APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(jansson::jansson PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "C"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/jansson.lib"
  )

list(APPEND _IMPORT_CHECK_TARGETS jansson::jansson )
list(APPEND _IMPORT_CHECK_FILES_FOR_jansson::jansson "${_IMPORT_PREFIX}/lib/jansson.lib" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
