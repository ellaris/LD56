/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod

event_inherited();

if(paused or dead)
	exit

// movement
var _horizontal = keyboard_check(ord("D"))-keyboard_check(ord("A")) + keyboard_check(vk_right)-keyboard_check(vk_left);
var _vertical = keyboard_check(ord("S"))-keyboard_check(ord("W")) + keyboard_check(vk_down)-keyboard_check(vk_up);

if(not slashing and not exhausted)
{
	var _dir = point_direction(0,0,_horizontal,_vertical)
	if(_horizontal != 0)
		x += lengthdir_x(move_speed, _dir);
	if(_vertical != 0)
		y += lengthdir_y(move_speed, _dir);
}

// tick down variable timers
if(slash_cd > 0)
	slash_cd -= 1;
if(exhausted > 0)
	exhausted -= 1;
if(slow_linger > 0)
	slow_linger -= 1;

// begin slashing
var _slash_press = keyboard_check(vk_space)
if(keyboard_check_pressed(vk_space) and not slashing and slash_cd <= 0 and exhausted <= 0 and available_slashes)
{
	slashing = true;
	available_slashes -= 1;
	if(slash_phantom)
	{
		var _phantom = instance_copy(false);// instance_create_layer(x,y,layer,object_index);
		_phantom.phantom = true;
		_phantom.slashing = true;
		_phantom.image_alpha = 0.7;
	}
}

// slashing state
if(slashing)
{
	// end of slash
	if(not _slash_press)
	{
		slashing = false;
		slash_exhaust_charge = 0;
		
		if(slash_invisibility)
		{
			with(obj_enemy)
			{
				state = "wander"
			}
			var _incident = instance_create_layer(x,y,layer,obj_incident);
			_incident.image_blend = c_dkgrey;
			_incident.image_speed = 1.5;
			_incident.owner = self;
		}
	}
	else
	{
		// slash
		var _enemy = instance_nearest(x,y,obj_enemy);
		if(_enemy)
		{
			var _dist = distance_to_object(_enemy);
			if(slash_cd <= 0 and _dist <= slash_range)
			{
				slash_cd = slash_cd_max;
				slash_exhaust_charge = 0;
				var _dir = point_direction(x,y,_enemy.x,_enemy.y);
				var _slash = instance_create_layer((x+_enemy.x)/2,(y+_enemy.y)/2,layer,obj_slash);
				_slash.image_angle = _dir;
				
				ds_list_add(_slash.hit,_enemy);
				_enemy.hp -= slash_damage;
				
				x += lengthdir_x(slash_range, _dir);
				y += lengthdir_y(slash_range, _dir);
				
				if(slash_linger)
					slow_linger = game_speed;
			}
		}
		
		// exhaustion, 1s of charge without enemy
		slash_exhaust_charge++;
		if(slash_exhaust_charge >= slash_exhaust_time)
		{
			exhausted = game_speed*1;
			slash_exhaust_charge = 0;
			slashing = false;
		}
	}

}

if(exhausted)
	sprite_index = spr_samurai_exhausted;
else
	sprite_index = spr_samurai;
	
if(phantom and not slashing)
	instance_destroy();
	
if(bbox_top < 0)
	y -= bbox_top;
if(bbox_bottom > room_height)
	y += room_height-bbox_bottom;
	
if(bbox_right > room_width)
	x += room_width-bbox_right;
if(bbox_left < 0)
	x -= bbox_left;