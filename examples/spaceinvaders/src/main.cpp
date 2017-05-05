#include <wiiuse/wpad.h>
#include <wiisprite.h>

int main(int argc, char **argv) {

    wsp::GameWindow gwd;
    gwd.InitVideo();

    gwd.SetBackground((GXColor) {255, 255, 255, 255});

    WPAD_Init();

    for (;;) {
        WPAD_ScanPads();
        if ((WPAD_ButtonsDown(WPAD_CHAN_0) & WPAD_BUTTON_HOME) != 0u){
            break;
        }
        gwd.Flush();
    }

    gwd.StopVideo();

    return 0;
}
