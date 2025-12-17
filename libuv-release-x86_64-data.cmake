########### AGGREGATED COMPONENTS AND DEPENDENCIES FOR THE MULTI CONFIG #####################
#############################################################################################

set(libuv_COMPONENT_NAMES "")
if(DEFINED libuv_FIND_DEPENDENCY_NAMES)
  list(APPEND libuv_FIND_DEPENDENCY_NAMES )
  list(REMOVE_DUPLICATES libuv_FIND_DEPENDENCY_NAMES)
else()
  set(libuv_FIND_DEPENDENCY_NAMES )
endif()

########### VARIABLES #######################################################################
#############################################################################################
set(libuv_PACKAGE_FOLDER_RELEASE "C:/Users/PC/.conan2/p/libuvbb7892f17138b/p")
set(libuv_BUILD_MODULES_PATHS_RELEASE )


set(libuv_INCLUDE_DIRS_RELEASE "${libuv_PACKAGE_FOLDER_RELEASE}/include")
set(libuv_RES_DIRS_RELEASE )
set(libuv_DEFINITIONS_RELEASE )
set(libuv_SHARED_LINK_FLAGS_RELEASE )
set(libuv_EXE_LINK_FLAGS_RELEASE )
set(libuv_OBJECTS_RELEASE )
set(libuv_COMPILE_DEFINITIONS_RELEASE )
set(libuv_COMPILE_OPTIONS_C_RELEASE )
set(libuv_COMPILE_OPTIONS_CXX_RELEASE )
set(libuv_LIB_DIRS_RELEASE "${libuv_PACKAGE_FOLDER_RELEASE}/lib")
set(libuv_BIN_DIRS_RELEASE )
set(libuv_LIBRARY_TYPE_RELEASE STATIC)
set(libuv_IS_HOST_WINDOWS_RELEASE 1)
set(libuv_LIBS_RELEASE libuv)
set(libuv_SYSTEM_LIBS_RELEASE iphlpapi psapi userenv ws2_32 dbghelp)
set(libuv_FRAMEWORK_DIRS_RELEASE )
set(libuv_FRAMEWORKS_RELEASE )
set(libuv_BUILD_DIRS_RELEASE )
set(libuv_NO_SONAME_MODE_RELEASE FALSE)


# COMPOUND VARIABLES
set(libuv_COMPILE_OPTIONS_RELEASE
    "$<$<COMPILE_LANGUAGE:CXX>:${libuv_COMPILE_OPTIONS_CXX_RELEASE}>"
    "$<$<COMPILE_LANGUAGE:C>:${libuv_COMPILE_OPTIONS_C_RELEASE}>")
set(libuv_LINKER_FLAGS_RELEASE
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${libuv_SHARED_LINK_FLAGS_RELEASE}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${libuv_SHARED_LINK_FLAGS_RELEASE}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${libuv_EXE_LINK_FLAGS_RELEASE}>")


set(libuv_COMPONENTS_RELEASE )