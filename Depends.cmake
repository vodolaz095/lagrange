if (IOS)
    include (Depends-iOS.cmake)
    return ()
endif ()

if (NOT EXISTS ${CMAKE_SOURCE_DIR}/lib/the_Foundation/CMakeLists.txt)
    set (INSTALL_THE_FOUNDATION YES)
    find_package (the_Foundation REQUIRED)
else ()
    set (INSTALL_THE_FOUNDATION NO)
    set (TFDN_STATIC_LIBRARY    ON  CACHE BOOL "")
    set (TFDN_ENABLE_INSTALL    OFF CACHE BOOL "")
    set (TFDN_ENABLE_TESTS      OFF CACHE BOOL "")
    set (TFDN_ENABLE_WEBREQUEST OFF CACHE BOOL "")
    add_subdirectory (lib/the_Foundation)
    add_library (the_Foundation::the_Foundation ALIAS the_Foundation)
endif ()
find_package (PkgConfig REQUIRED)
pkg_check_modules (SDL2 REQUIRED sdl2)
pkg_check_modules (MPG123 IMPORTED_TARGET libmpg123)
