// check that SDL_GetVersion picks up correct version

#include <SDL2/SDL.h>

int main(int argc, char** argv) {
    SDL_version C; // Compiled
    SDL_version L; // Linked

    SDL_VERSION(&C);
    SDL_GetVersion(&L);

    if (C.major != L.major || C.minor != L.minor || C.patch != L.patch) {
        return 1;
    }

    return 0;
}
