/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod

game_speed = game_get_speed(gamespeed_fps);
level_button_columns = 5;
end_game_timer = game_speed;

audio_group_load(ag_music)
audio_group_load(ag_sfx)
audio_group_load(ag_voice)

function slider(_description, _group, _val = 100, _width = 96, _height = 32) constructor {
	value = _val;
	width = _width;
	height = _height;
	audio_group = _group;
	description = _description;
	
	apply = function(){
		audio_group_set_gain(asset_get_index(audio_group), value, 0);
	}
	
	draw = function(_xx, _yy){
		var _hover = point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0),_xx,_yy,_xx+width,_yy+height);
		draw_rectangle(_xx,_yy,_xx+width,_yy+height,true);
		var _ratio = value/100*width;
		draw_rectangle(_xx+_ratio+2,_yy+2,_xx+_ratio-2,_yy+height-2,false);
		
		draw_text(_xx,_yy+height+2+8,description)
		
		if(_hover and mouse_check_button(mb_left))
		{
			value = (device_mouse_x_to_gui(0)-_xx)/width*100;
			apply();
		}
	}
}

function checkbox(_description, _var, _val = false, _width = 32, _height = 32) constructor {
	value = _val;
	width = _width;
	height = _height;
	variable = _var;
	description = _description;
	
	apply = function(){
		variable_instance_set(obj_control.id, variable, value);
	}
	
	draw = function(_xx, _yy){
		var _hover = point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0),_xx,_yy,_xx+width,_yy+height);
		draw_rectangle(_xx,_yy,_xx+width,_yy+height,true);
		if(value)
			draw_rectangle(_xx+2,_yy+2,_xx+width-2,_yy+height-2,false);
			
		draw_text(_xx,_yy+height+8+2,description)
		
		if(_hover and mouse_check_button_pressed(mb_left))
		{
			value = not value;
			apply();
		}
	}
}


function challenge(_text, _check) constructor {
	value = 0;
	text = _text;
	check_function = _check;
	
	check = function()
	{
		return(method_call(check_function,[]));
	}
}

function upgrade(_text, _spr, _var, _mult, _cost = 3) constructor {
	value = 0;
	text = _text;
	cost = _cost;
	sprite = _spr;
	var_name = _var;
	multiplayer = _mult;
	
	apply = function(_player)
	{
		variable_instance_set(_player,var_name,variable_instance_get(_player,var_name) + value*multiplayer);
	}
	
	get_text = function()
	{
		return string("{0} stars <=> {1} ",cost,multiplayer)+text;
	}
	
	draw = function(_xx,_yy, _exclusive)
	{
		var _hover = point_in_rectangle(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),
			_xx,_yy,_xx+128,_yy+80);
		draw_set_color(c_teal);
		if(value)
			draw_rectangle(_xx,_yy,_xx+128,_yy+80,false);
			draw_set_color(c_blue);
		if(_hover)
			draw_set_color(c_aqua);
		draw_rectangle(_xx,_yy,_xx+128,_yy+80,true);
		draw_sprite_ext(sprite,0,_xx+64,_yy+40,2,2,0,c_white,1);
		
		draw_set_color(c_orange);
		if(_hover)
		{
			//draw_set_valign(fa_top);
			draw_text_ext(_xx+0,_yy+96+4,get_text(),-1,128);
			if(mouse_check_button_pressed(mb_left))
			{
				var _wratio = room_width/view_wport;
				var _hratio = room_height/view_hport;
				if(value)
				{
					value = 0;
					//obj_control.stars += cost
					repeat cost
					create_star((_xx+32+irandom(16)-8)*_wratio,(_yy+40+irandom(16)-8)*_hratio);
				}
				else
				{
					var _paid = false;
					if(array_contains(_exclusive,self))
					for(var i = 0; i < array_length(_exclusive);i++)
					{
						var _item = _exclusive[i];
						if(_item.value and _item != self)
						{
							_paid = true;
							_item.value = 0;
						}
					}
					if(obj_control.stars >= cost or _paid)
					{
						
						
						if(not _paid)
						obj_control.stars -= cost;
						value += 1;
						repeat cost
						create_star(room_width-(32+irandom(16)-8)*_wratio,(32+irandom(16)-8)*_hratio,(_xx+32)*_wratio,(_yy+40)*_hratio,false);
					}
				}
			}
		}
		else
		draw_text(_xx+8,_yy+80+14,text);
	}
}




paused = true;


//challenge_1_slash = 0;

//text_challenge_1_slash = "Kill all enemies using only 1 slash"

check_challenge_1_slash = function()
{
	var _val = 0;
	if(instance_number(obj_enemy) > 0 and (obj_player.available_slashes < obj_player.max_slashes-1))
		_val = -1;
	if(instance_number(obj_enemy) == 0 and obj_player.available_slashes >= obj_player.max_slashes-1)
		_val = 1;
	return(_val)
}

check_challenge_2_cactus_kills = function()
{
	var _val = 0;
	var _kill_count = 0;
	with(obj_cactus)
		_kill_count += kills;
	if(instance_number(obj_enemy) < 2-_kill_count)
		_val = -1;
	if(_kill_count >= 2)
		_val = 1;
	return(_val)
}


check_challenge_no_river = function()
{
	var _val = 0;
	var _touched = 0;
	with(obj_river)
		_touched += touched;
	if(_touched > 0)
		_val = -1;
	if(instance_number(obj_enemy) <= 0 and not _touched)
		_val = 1;
	return(_val)
}

check_challenge_12_sec = function()
{
	var _val = 0;
	if((obj_timer.time div game_speed) > 12 )
		_val = -1;
	if(instance_number(obj_enemy) <= 0)
		_val = 1;
	return(_val)
}

check_challenge_no_movement = function()
{
	var _val = 0;
	if(keyboard_check_pressed(vk_left) or keyboard_check_pressed(vk_right) or
		keyboard_check_pressed(vk_down) or keyboard_check_pressed(vk_up) or
		keyboard_check_pressed(ord("A")) or keyboard_check_pressed(ord("D")) or
		keyboard_check_pressed(ord("W")) or keyboard_check_pressed(ord("S")) )
		_val = -1;
	if(instance_number(obj_enemy) <= 0)
		_val = 1;
	return(_val)
}

check_challenge_move_tutorial = function()
{
	var _val = 0;
	if(keyboard_check_pressed(vk_left) or keyboard_check_pressed(vk_right) or
		keyboard_check_pressed(vk_down) or keyboard_check_pressed(vk_up) or
		keyboard_check_pressed(ord("A")) or keyboard_check_pressed(ord("D")) or
		keyboard_check_pressed(ord("W")) or keyboard_check_pressed(ord("S")) )
		_val = 1;
	if(instance_number(obj_enemy) <= 0)
		_val = -1;
	return(_val)
}

check_attack_tutorial = function()
{
	var _val = 0;
	if(keyboard_check_pressed(vk_space))
		_val = 1;
	if(instance_number(obj_enemy) <= 0)
		_val = -1;
	return(_val)
}

check_exhaust_tutorial = function()
{
	var _val = 0;
	if(obj_player.exhausted)
		_val = 1;
	if(instance_number(obj_enemy) <= 0)
		_val = -1;
	return(_val)
}

check_challenge_collect_gold = function()
{
	var _val = 0;
	if(not instance_exists(obj_gold))
		_val = 1;
	if(instance_number(obj_enemy) <= 0)
		_val = -1;
	return(_val)
}

check_challenge_gold_before_attack = function()
{
	var _val = 0;
	if(not instance_exists(obj_gold))
		_val = 1;
	if(obj_player.available_slashes != obj_player.max_slashes)
		_val = -1;
	return(_val)
}

check_challenge_perfect_no_buffs = function()
{
	var _val = 0;
	if(stars == (current_level+1)*3)
		_val = 1;
	if(stars < (current_level+1)*3)
		_val = -1;
	return(_val)
}


challenge_1_slash = new challenge("Kill all enemies using only 1 slash", check_challenge_1_slash);
challenge_2_cactus_kills = new challenge("Kill 2 enemies using a cactus", check_challenge_2_cactus_kills);
challenge_no_movement = new challenge("Kill all enemies without moving",check_challenge_no_movement);
challenge_12_sec = new challenge("Kill all enemies within 12 seconds",check_challenge_12_sec);
challenge_no_river = new challenge("Kill all enemies without crossing the river",check_challenge_no_river);
challenge_move_tutorial =  new challenge("Move with W A S D keys or the arrow keys",check_challenge_move_tutorial);
challenge_attack_tutorial =  new challenge("Hold the Space key to slash enemies within range, you can start slashing 3 times",check_attack_tutorial);
challenge_exhaust_tutorial = new challenge("Hold the slash key for half a second with no enemies in range to become exhausted",check_exhaust_tutorial)
challenge_collect_gold = new challenge("Collect the gold",check_challenge_collect_gold);
challenge_gold_before_attack = new challenge("Collect the gold before slashing",check_challenge_gold_before_attack);
challenge_perfect_no_buffs = new challenge("Have all previous stars unspent",check_challenge_perfect_no_buffs);


level_challenges = []
level1_challenges = [challenge_move_tutorial, challenge_attack_tutorial]
level2_challenges = [challenge_exhaust_tutorial, challenge_gold_before_attack]
level3_challenges = [challenge_2_cactus_kills, challenge_no_river]
level4_challenges = [challenge_no_river, challenge_12_sec]
level5_challenges = [challenge_1_slash, challenge_12_sec]
level6_challenges = [challenge_perfect_no_buffs, challenge_2_cactus_kills]
level7_challenges = [challenge_no_movement, challenge_1_slash]
level8_challenges = [challenge_gold_before_attack, challenge_12_sec]
level9_challenges = [challenge_no_movement, challenge_1_slash]
level10_challenges = [challenge_collect_gold, challenge_collect_gold]
level11_challenges = [challenge_collect_gold, challenge_collect_gold]

level_stars = [0,0,0,0,0,0,0,0,0,0,0]
current_level = -1;

stars = 0;

upgrade_range = new upgrade("Range",spr_icon_range,"slash_range",32,3);
upgrade_speed = new upgrade("Speed",spr_icon_speed,"move_speed",0.4,5);
upgrade_cd = new upgrade("CoolDown",spr_icon_cd,"slash_cd_max",-10,6);
upgrade_damage = new upgrade("Damage",spr_icon_damage,"slash_damage",1,3);
upgrade_slash = new upgrade("Extra attacks",spr_icon_slashes,"max_slashes",1,6);

upgrade_phantom = new upgrade("Phantom slash",spr_icon_phantom,"slash_phantom",1,10);
upgrade_aoe = new upgrade("Area slash",spr_icon_aoe,"slash_aoe",1,10);
upgrade_invisible = new upgrade("Hidden slash",spr_icon_hidden,"slash_invisibility",1,10);
upgrade_linger = new upgrade("Residual slash",spr_icon_lingering,"slash_linger",1,10);

upgrade_exclusive = [upgrade_phantom, upgrade_aoe, upgrade_invisible,upgrade_linger]
upgrade_list = [upgrade_range, upgrade_speed, upgrade_cd, upgrade_damage, upgrade_slash, upgrade_phantom, upgrade_aoe, upgrade_invisible, upgrade_linger]

display_list = function(_xx, _yy, _col_size, _list, _method = "draw", _args = [], _padding = 8)
{
	//_xx = view_wport-256-128-128;
	//_yy = 32;
	
	for(var i = 0; i < array_length(_list); i++)
	{
		var _element = _list[i];
		method_call(variable_struct_get(_element,_method) ,
			array_concat(_args,[_xx+(i div _col_size)*(_element.width+_padding),_yy+(_padding+16+_element.height)*(i mod _col_size)]));
		//_element.draw(_xx+(i div _col_size)*_element.width,_yy+_element.height*(i mod _col_size));
	}
}

slider_music = new slider("Music","ag_music",70);
slider_sfx = new slider("SFX","ag_sfx",90);
slider_voice = new slider("Voice","ag_voice",50);

slider_list = [slider_music, slider_sfx, slider_voice];

checkbox_range = new checkbox("Display range","show_ranges",0);
checkbox_touchpad = new checkbox("Touchscreen","touchpad_controls",0);

checkbox_list = [checkbox_range,checkbox_touchpad];

show_ranges = false;
touchpad_controls = false;