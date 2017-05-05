set(SOURCES source/gamewindow.cpp source/gamewindow.h
        source/image.cpp source/image.h
        source/layer.cpp source/layer.h
        source/layermanager.cpp source/layermanager.h
        source/quad.cpp source/quad.h
        source/sprite.cpp source/sprite.h
        source/tiledlayer.cpp source/tiledlayer.h
        source/wiisprite.h)

add_library(wiisprite STATIC ${SOURCES})
target_include_directories(wiisprite PUBLIC source)
target_link_libraries(wiisprite PUBLIC png ogc m)
