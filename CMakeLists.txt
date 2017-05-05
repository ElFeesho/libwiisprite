cmake_minimum_required(VERSION 3.2.0)
project(libwiisprite)
include(${PROJECT_SOURCE_DIR}/devkitPPC.RVL.cmake)

add_definitions(-DGEKKO -mrvl -mcpu=750 -meabi -mhard-float)

add_subdirectory(libwiisprite)
add_subdirectory(examples)

add_dependencies(spaceinvaders.elf wiisprite)