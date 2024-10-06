/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod


time += 1/game_get_speed(gamespeed_fps)/4;

if(play_sound and time > 0.6)
{
	play_sound = false;
	audio_play_sound(sound_asset,6,false);
}

//if(time > 3)
//{
//	time = 0
//	state(3);
//}