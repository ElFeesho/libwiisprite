#include <ogcsys.h>
#include <wiiuse/wpad.h>
#include <wiisprite.h>

int main() {

    wsp::GameWindow gwd;
    gwd.InitVideo();

    gwd.SetBackground((GXColor) {255, 0, 255, 255});

    wsp::Rectangle *rect = new wsp::Rectangle{};
    rect->x = 100.f;
    rect->y = 100.f;
    rect->width = 100.f;
    rect->height = 100.f;

    wsp::Quad quadT{};
    quadT.SetRectangle(rect);

    quadT.SetFillColor({255, 0,0, 255});

    WPAD_Init();

    for (;;) {
        WPAD_ScanPads();
        if ((WPAD_ButtonsDown(WPAD_CHAN_0) & WPAD_BUTTON_HOME) != 0u){
            break;
        }
        quadT.Draw(0, 0);

        gwd.Flush();
    }

    return 0;
}