/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod

if(keyboard_check_pressed(vk_f12))
{
	for(var i = 0; i < array_length(level_stars); i++)
		level_stars[i] = 3;
	stars = array_length(level_stars)*3;
	//cheat = true;
}

if(room != rm_start)
{
	var _angle = camera_get_view_angle(view_get_camera(0));
	if(_angle != 0)
	camera_set_view_angle(view_get_camera(0),_angle+sign(angle_difference(0,_angle)));
	
	if(keyboard_check_pressed(ord("R")))
		room_restart();
	
	if(keyboard_check_pressed(vk_escape))
		room_goto(rm_start);
	
	for(var i = 0; i < array_length(level_challenges); i++)
	{
		var _chall = level_challenges[i];
		if(_chall.value == 0)
		_chall.value = _chall.check()
	}


	if(paused and keyboard_check_pressed(vk_anykey))
	{
		with obj_entity
			paused = false;
		paused = false;
	}
		
	if(not instance_exists(obj_enemy))
		if(keyboard_check_pressed(vk_anykey) and end_game_timer <= 0 and keyboard_lastchar != "r")
			room_goto(rm_start);
}
else
{
	if(not audio_is_playing(music))	
		music = audio_play_sound(snd_music_menu,4,true);
}
//else
//{
//	for(var i = 0; i < array_length(level_stars); i++)
//	{
//		var _stars = level_stars[i];
//		var _last_stars = 1;
//		if(i > 0)
//			_last_stars = level_stars[i-1];
//		//draw_set_color(c_dkgrey)
//		//if(_last_stars)
//		//	draw_set_color(c_ltgray)
//		var _xx = i*32;
//		//draw_rectangle(_xx+32,64,_xx+64,64+32,true);
//		//draw_text(_xx+32+8,64+16,"L"+string(1+i));
//		//for(var j = 0; j < _stars; j++)
//		//	draw_sprite(spr_star,0,_xx+6+8*j,64+20);
//		if(_last_stars and mouse_check_button_pressed(mb_left) and point_in_rectangle(mouse_x,mouse_y,_xx+32,64,_xx+64,64+32))
//		{
//			current_level = i;
//			room_goto(asset_get_index("rm_level"+string(1+i)));
//		}
//	}
//}