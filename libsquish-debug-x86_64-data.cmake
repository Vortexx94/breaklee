########### AGGREGATED COMPONENTS AND DEPENDENCIES FOR THE MULTI CONFIG #####################
#############################################################################################

set(libsquish_COMPONENT_NAMES "")
if(DEFINED libsquish_FIND_DEPENDENCY_NAMES)
  list(APPEND libsquish_FIND_DEPENDENCY_NAMES )
  list(REMOVE_DUPLICATES libsquish_FIND_DEPENDENCY_NAMES)
else()
  set(libsquish_FIND_DEPENDENCY_NAMES )
endif()

########### VARIABLES #######################################################################
#############################################################################################
set(libsquish_PACKAGE_FOLDER_DEBUG "C:/Users/PC/.conan2/p/b/libsq3978587505cfc/p")
set(libsquish_BUILD_MODULES_PATHS_DEBUG )


set(libsquish_INCLUDE_DIRS_DEBUG "${libsquish_PACKAGE_FOLDER_DEBUG}/include")
set(libsquish_RES_DIRS_DEBUG )
set(libsquish_DEFINITIONS_DEBUG )
set(libsquish_SHARED_LINK_FLAGS_DEBUG )
set(libsquish_EXE_LINK_FLAGS_DEBUG )
set(libsquish_OBJECTS_DEBUG )
set(libsquish_COMPILE_DEFINITIONS_DEBUG )
set(libsquish_COMPILE_OPTIONS_C_DEBUG )
set(libsquish_COMPILE_OPTIONS_CXX_DEBUG )
set(libsquish_LIB_DIRS_DEBUG "${libsquish_PACKAGE_FOLDER_DEBUG}/lib")
set(libsquish_BIN_DIRS_DEBUG )
set(libsquish_LIBRARY_TYPE_DEBUG STATIC)
set(libsquish_IS_HOST_WINDOWS_DEBUG 1)
set(libsquish_LIBS_DEBUG squishd)
set(libsquish_SYSTEM_LIBS_DEBUG )
set(libsquish_FRAMEWORK_DIRS_DEBUG )
set(libsquish_FRAMEWORKS_DEBUG )
set(libsquish_BUILD_DIRS_DEBUG )
set(libsquish_NO_SONAME_MODE_DEBUG FALSE)


# COMPOUND VARIABLES
set(libsquish_COMPILE_OPTIONS_DEBUG
    "$<$<COMPILE_LANGUAGE:CXX>:${libsquish_COMPILE_OPTIONS_CXX_DEBUG}>"
    "$<$<COMPILE_LANGUAGE:C>:${libsquish_COMPILE_OPTIONS_C_DEBUG}>")
set(libsquish_LINKER_FLAGS_DEBUG
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${libsquish_SHARED_LINK_FLAGS_DEBUG}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${libsquish_SHARED_LINK_FLAGS_DEBUG}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${libsquish_EXE_LINK_FLAGS_DEBUG}>")


set(libsquish_COMPONENTS_DEBUG )