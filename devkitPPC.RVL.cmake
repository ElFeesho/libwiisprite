# Lovingly borrowed from: https://raw.githubusercontent.com/GerbilSoft/gens-gs-ii/master/cmake/toolchain/devkitPPC.RVL.cmake
# Based on dolphin's toolchain-powerpc.cmake.
# https://github.com/dolphin-emu/hwtests/blob/master/toolchain-powerpc.cmake
SET(DEVKITPRO "$ENV{DEVKITPRO}")
SET(DEVKITPPC "$ENV{DEVKITPPC}")

SET(CMAKE_SYSTEM_NAME "Generic")
SET(CMAKE_SYSTEM_VERSION 0)
SET(CMAKE_SYSTEM_PROCESSOR powerpc-eabi)

SET(ELF2DOL "${DEVKITPPC}/bin/elf2dol")

SET(CMAKE_C_COMPILER    "${DEVKITPPC}/bin/powerpc-eabi-gcc")
SET(CMAKE_CXX_COMPILER  "${DEVKITPPC}/bin/powerpc-eabi-g++")
SET(CMAKE_AR            "${DEVKITPPC}/bin/powerpc-eabi-ar")
SET(CMAKE_NM            "${DEVKITPPC}/bin/powerpc-eabi-nm")
SET(CMAKE_RANLIB        "${DEVKITPPC}/bin/powerpc-eabi-ranlib")

INCLUDE_DIRECTORIES("${DEVKITPRO}/libogc/include")

LINK_DIRECTORIES("${DEVKITPRO}/libogc/lib/wii")

SET(CMAKE_C_FLAGS   "-mrvl -mcpu=750 -meabi -mhard-float")
SET(CMAKE_CXX_FLAGS "-mrvl -mcpu=750 -meabi -mhard-float")

SET(LIBS_TO_LINK "-lwiiuse -lbte -logc -lm")

SET(CMAKE_C_STANDARD_LIBRARIES "${LIBS_TO_LINK}")
SET(CMAKE_C_ARCHIVE_CREATE "<CMAKE_AR> rc <TARGET> <LINK_FLAGS> <OBJECTS>")
set(CMAKE_C_COMPILE_OBJECT "<CMAKE_C_COMPILER> -MMD -MP -MF <OBJECT>.d <INCLUDES> <FLAGS> -c <SOURCE> -o <OBJECT>")
set(CMAKE_C_LINK_EXECUTABLE "<CMAKE_C_COMPILER> <OBJECTS> <FLAGS> <CMAKE_C_LINK_FLAGS> <LINK_FLAGS> -Wl,-Map,<TARGET>.map  -o <TARGET> <LINK_LIBRARIES>")

SET(CMAKE_CXX_STANDARD_LIBRARIES "${LIBS_TO_LINK}")
SET(CMAKE_CXX_ARCHIVE_CREATE "<CMAKE_AR> rc <TARGET> <LINK_FLAGS> <OBJECTS>")
set(CMAKE_CXX_COMPILE_OBJECT "<CMAKE_CXX_COMPILER> -MMD -MP -MF <OBJECT>.d <INCLUDES> <FLAGS> -c <SOURCE> -o <OBJECT>")
set(CMAKE_CXX_LINK_EXECUTABLE "<CMAKE_CXX_COMPILER> <OBJECTS> <FLAGS> -Wl,-Map,<TARGET>.map  -o <TARGET> <LINK_LIBRARIES>")

ADD_DEFINITIONS(-DGEKKO)
