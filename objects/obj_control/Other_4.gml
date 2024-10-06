/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod
if(room != rm_start)
{
	end_game_timer = game_speed;
	//current_level = real(string_delete(room_get_name(room), 1, 8))-1;
	var _room_var_name = string_delete(room_get_name(room), 1, 3)+"_challenges";
	var _challenges = variable_instance_get(self,_room_var_name);
	//show_debug_message(_room_var_name);
	if(not is_undefined(_challenges))
		level_challenges = _challenges;
		
	var i = 0;
	repeat 2
	{
		var _chall = level_challenges[i];
		_chall.value = 0;
		i++
	}
	
	var _timer = instance_create_layer(0,0,layer,obj_timer);
	//_timer.time = game_get_speed(gamespeed_fps)*12;
	
	with(obj_entity)
		paused = true
	
	paused = true;
	
	for(var i = 0; i < array_length(upgrade_list); i++)
	{
		var _upgrade = upgrade_list[i];
		_upgrade.apply(obj_player.id);
	}
	//upgrade_range.apply(obj_player.id);
	
	with(obj_player)
		available_slashes = max_slashes;
		 
	var _c = audio_sound_get_track_position(music)* audio_sound_length(snd_music)/audio_sound_length(snd_music_menu);
	audio_stop_sound(music);
	music = audio_play_sound(snd_music,4,true);
	audio_sound_set_track_position(music,_c);
	
}
else
{
	if(level_stars[0] == 0)
	{
		var _cutscene = instance_create_layer(0,0,layer,obj_cutscene);
	}
	
	if(level_stars[array_length(level_stars)-1] != 0 and not end_cutscene)
	{
		end_cutscene = true;
		var _cutscene = instance_create_layer(0,0,layer,obj_cutscene);
		_cutscene.state(2);
	}
	var _stars = 0;
	for(var i = 0; i < array_length(level_stars); i++)
		_stars += level_stars[i]
	if(_stars == array_length(level_stars)*3 and not cheat and not special_cutscene)
	{
		var _t = 0.5;
		if(instance_exists(obj_cutscene))
		_t = -1.8;
		special_cutscene = true;
		var _cutscene = instance_create_layer(0,0,layer,obj_cutscene);
		_cutscene.state(3);
		_cutscene.time = _t;
	}
	
	//if(not first_music)
	{
		var _c = audio_sound_get_track_position(music)* audio_sound_length(snd_music_menu)/audio_sound_length(snd_music);
		audio_stop_sound(music);
		music = audio_play_sound(snd_music_menu,4,true);
		audio_sound_set_track_position(music,_c);
	}
	//else
	//{
	//	music = audio_play_sound(snd_music_menu,4,true);
	//	first_music = false;
	//}
}

