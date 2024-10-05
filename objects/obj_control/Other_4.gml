/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod
if(room != rm_start)
{
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
	_timer.time = game_get_speed(gamespeed_fps)*12;
	
	with(obj_entity)
		paused = true
	
	paused = true;
	
	upgrade_range.apply(obj_player.id);

	
}

