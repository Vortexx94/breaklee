# Avoid multiple calls to find_package to append duplicated properties to the targets
include_guard()########### VARIABLES #######################################################################
#############################################################################################
set(libsquish_FRAMEWORKS_FOUND_DEBUG "") # Will be filled later
conan_find_apple_frameworks(libsquish_FRAMEWORKS_FOUND_DEBUG "${libsquish_FRAMEWORKS_DEBUG}" "${libsquish_FRAMEWORK_DIRS_DEBUG}")

set(libsquish_LIBRARIES_TARGETS "") # Will be filled later


######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
if(NOT TARGET libsquish_DEPS_TARGET)
    add_library(libsquish_DEPS_TARGET INTERFACE IMPORTED)
endif()

set_property(TARGET libsquish_DEPS_TARGET
             APPEND PROPERTY INTERFACE_LINK_LIBRARIES
             $<$<CONFIG:Debug>:${libsquish_FRAMEWORKS_FOUND_DEBUG}>
             $<$<CONFIG:Debug>:${libsquish_SYSTEM_LIBS_DEBUG}>
             $<$<CONFIG:Debug>:>)

####### Find the libraries declared in cpp_info.libs, create an IMPORTED target for each one and link the
####### libsquish_DEPS_TARGET to all of them
conan_package_library_targets("${libsquish_LIBS_DEBUG}"    # libraries
                              "${libsquish_LIB_DIRS_DEBUG}" # package_libdir
                              "${libsquish_BIN_DIRS_DEBUG}" # package_bindir
                              "${libsquish_LIBRARY_TYPE_DEBUG}"
                              "${libsquish_IS_HOST_WINDOWS_DEBUG}"
                              libsquish_DEPS_TARGET
                              libsquish_LIBRARIES_TARGETS  # out_libraries_targets
                              "_DEBUG"
                              "libsquish"    # package_name
                              "${libsquish_NO_SONAME_MODE_DEBUG}")  # soname

# FIXME: What is the result of this for multi-config? All configs adding themselves to path?
set(CMAKE_MODULE_PATH ${libsquish_BUILD_DIRS_DEBUG} ${CMAKE_MODULE_PATH})

########## GLOBAL TARGET PROPERTIES Debug ########################################
    set_property(TARGET libsquish::libsquish
                 APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                 $<$<CONFIG:Debug>:${libsquish_OBJECTS_DEBUG}>
                 $<$<CONFIG:Debug>:${libsquish_LIBRARIES_TARGETS}>
                 )

    if("${libsquish_LIBS_DEBUG}" STREQUAL "")
        # If the package is not declaring any "cpp_info.libs" the package deps, system libs,
        # frameworks etc are not linked to the imported targets and we need to do it to the
        # global target
        set_property(TARGET libsquish::libsquish
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     libsquish_DEPS_TARGET)
    endif()

    set_property(TARGET libsquish::libsquish
                 APPEND PROPERTY INTERFACE_LINK_OPTIONS
                 $<$<CONFIG:Debug>:${libsquish_LINKER_FLAGS_DEBUG}>)
    set_property(TARGET libsquish::libsquish
                 APPEND PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                 $<$<CONFIG:Debug>:${libsquish_INCLUDE_DIRS_DEBUG}>)
    # Necessary to find LINK shared libraries in Linux
    set_property(TARGET libsquish::libsquish
                 APPEND PROPERTY INTERFACE_LINK_DIRECTORIES
                 $<$<CONFIG:Debug>:${libsquish_LIB_DIRS_DEBUG}>)
    set_property(TARGET libsquish::libsquish
                 APPEND PROPERTY INTERFACE_COMPILE_DEFINITIONS
                 $<$<CONFIG:Debug>:${libsquish_COMPILE_DEFINITIONS_DEBUG}>)
    set_property(TARGET libsquish::libsquish
                 APPEND PROPERTY INTERFACE_COMPILE_OPTIONS
                 $<$<CONFIG:Debug>:${libsquish_COMPILE_OPTIONS_DEBUG}>)

########## For the modules (FindXXX)
set(libsquish_LIBRARIES_DEBUG libsquish::libsquish)
