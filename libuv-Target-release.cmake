# Avoid multiple calls to find_package to append duplicated properties to the targets
include_guard()########### VARIABLES #######################################################################
#############################################################################################
set(libuv_FRAMEWORKS_FOUND_RELEASE "") # Will be filled later
conan_find_apple_frameworks(libuv_FRAMEWORKS_FOUND_RELEASE "${libuv_FRAMEWORKS_RELEASE}" "${libuv_FRAMEWORK_DIRS_RELEASE}")

set(libuv_LIBRARIES_TARGETS "") # Will be filled later


######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
if(NOT TARGET libuv_DEPS_TARGET)
    add_library(libuv_DEPS_TARGET INTERFACE IMPORTED)
endif()

set_property(TARGET libuv_DEPS_TARGET
             APPEND PROPERTY INTERFACE_LINK_LIBRARIES
             $<$<CONFIG:Release>:${libuv_FRAMEWORKS_FOUND_RELEASE}>
             $<$<CONFIG:Release>:${libuv_SYSTEM_LIBS_RELEASE}>
             $<$<CONFIG:Release>:>)

####### Find the libraries declared in cpp_info.libs, create an IMPORTED target for each one and link the
####### libuv_DEPS_TARGET to all of them
conan_package_library_targets("${libuv_LIBS_RELEASE}"    # libraries
                              "${libuv_LIB_DIRS_RELEASE}" # package_libdir
                              "${libuv_BIN_DIRS_RELEASE}" # package_bindir
                              "${libuv_LIBRARY_TYPE_RELEASE}"
                              "${libuv_IS_HOST_WINDOWS_RELEASE}"
                              libuv_DEPS_TARGET
                              libuv_LIBRARIES_TARGETS  # out_libraries_targets
                              "_RELEASE"
                              "libuv"    # package_name
                              "${libuv_NO_SONAME_MODE_RELEASE}")  # soname

# FIXME: What is the result of this for multi-config? All configs adding themselves to path?
set(CMAKE_MODULE_PATH ${libuv_BUILD_DIRS_RELEASE} ${CMAKE_MODULE_PATH})

########## GLOBAL TARGET PROPERTIES Release ########################################
    set_property(TARGET uv
                 APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                 $<$<CONFIG:Release>:${libuv_OBJECTS_RELEASE}>
                 $<$<CONFIG:Release>:${libuv_LIBRARIES_TARGETS}>
                 )

    if("${libuv_LIBS_RELEASE}" STREQUAL "")
        # If the package is not declaring any "cpp_info.libs" the package deps, system libs,
        # frameworks etc are not linked to the imported targets and we need to do it to the
        # global target
        set_property(TARGET uv
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     libuv_DEPS_TARGET)
    endif()

    set_property(TARGET uv
                 APPEND PROPERTY INTERFACE_LINK_OPTIONS
                 $<$<CONFIG:Release>:${libuv_LINKER_FLAGS_RELEASE}>)
    set_property(TARGET uv
                 APPEND PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                 $<$<CONFIG:Release>:${libuv_INCLUDE_DIRS_RELEASE}>)
    # Necessary to find LINK shared libraries in Linux
    set_property(TARGET uv
                 APPEND PROPERTY INTERFACE_LINK_DIRECTORIES
                 $<$<CONFIG:Release>:${libuv_LIB_DIRS_RELEASE}>)
    set_property(TARGET uv
                 APPEND PROPERTY INTERFACE_COMPILE_DEFINITIONS
                 $<$<CONFIG:Release>:${libuv_COMPILE_DEFINITIONS_RELEASE}>)
    set_property(TARGET uv
                 APPEND PROPERTY INTERFACE_COMPILE_OPTIONS
                 $<$<CONFIG:Release>:${libuv_COMPILE_OPTIONS_RELEASE}>)

########## For the modules (FindXXX)
set(libuv_LIBRARIES_RELEASE uv)
