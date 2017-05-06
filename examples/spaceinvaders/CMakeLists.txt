add_executable(spaceinvaders.elf src/main.cpp)
target_link_libraries(spaceinvaders.elf PRIVATE wiisprite)
add_custom_command(TARGET spaceinvaders.elf POST_BUILD COMMAND ${ELF2DOL} $<TARGET_FILE:spaceinvaders.elf> spaceinvaders.dol)