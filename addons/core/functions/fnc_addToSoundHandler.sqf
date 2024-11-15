#include "script_component.hpp"
/*
 * Author: LAxemann and joko // Jonas
 * add Sound Effects with Data to the SoundHandler Queue and set the newSound Flag to start Sorting
 *
 * Arguments:
 * 0: Time <Number>
 * 1: Type <Number>
 * 2: Data for Sound <Number>
 *
 * Return Value:
 * None
 */


GVAR(soundHandler) pushBack _this;
GVAR(newSoundHandler) = true;