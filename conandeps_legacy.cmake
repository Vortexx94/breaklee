message(STATUS "Conan: Using CMakeDeps conandeps_legacy.cmake aggregator via include()")
message(STATUS "Conan: It is recommended to use explicit find_package() per dependency instead")

find_package(libuv)
find_package(lua)
find_package(OpenSSL)
find_package(SQLite3)
find_package(ZLIB)
find_package(raylib)
find_package(libsquish)

set(CONANDEPS_LEGACY  uv  lua::lua  openssl::openssl  SQLite::SQLite3  ZLIB::ZLIB  raylib  libsquish::libsquish )