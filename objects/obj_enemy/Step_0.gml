/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod

event_inherited()

if(paused)
	exit

var _slow_mow = (1- (slow_strength *(obj_player.slashing or obj_player.slow_linger)));
var _ms = move_speed * _slow_mow;

step += step_tend*_ms/(obj_control.game_speed/6);
if(abs(step) >= abs(step_tend))
{
	step = step_tend;
	step_tend *= -1;
	part_particles_create(obj_control.part_system,x,bbox_bottom,obj_control.part_type_dirt,1);
}


// flip patrolloing
if((wander_x < 0 and x <= 32) or (wander_x > 0 and x >= room_width-32))
	wander_x *= -1;
	
if((wander_y < 0 and y <= 32) or (wander_y > 0 and y >= room_height-32))
	wander_y *= -1;

if( hp <= 0)
{
	var _body = instance_create_layer(x,y,layer,obj_body);
	_body.sprite_index = sprite_index;
	_body.push_direction = push_direction;
	_body.push_strength = push_strength;
	_body.slow_strength = slow_strength;
	_body.image_alpha = 0.75;
	instance_destroy();
}
	//instance_change(obj_body,true);
	
if(state == "wander")
{
	var _dist = distance_to_object(obj_player);
	if(_dist <= notice_range)
	{
		audio_play_sound(snd_notice,4,false);
		with(obj_enemy)
		{
			state = "chase"
			var _incident = instance_create_layer(x,y,layer,obj_incident);
			_incident.image_blend = c_yellow;
			_incident.owner = self;
			_incident.image_speed = 1.5;
		}
	}
	
	x += _ms*3/4*wander_x;
	y += _ms*3/4*wander_y;
}
else
{
	var _dist = distance_to_object(obj_player);
	if(_dist <= notice_range/4)
		state = "attack"
	else
		state = "chase"
	move_towards_point(obj_player.x,obj_player.y,_ms);
}

if(state == "attack")
{
	attack_charge += 1*_slow_mow;
	if(attack_charge >= attack_time and not obj_player.dead)
	{
		audio_play_sound(snd_defeat,1,false);
		part_particles_create(obj_control.part_system,obj_player.x,obj_player.y,obj_control.part_type_blood,40);
		attack_charge = 0;
		obj_player.dead = true;
		var _incident = instance_create_layer(x,y,layer,obj_incident);
		_incident.image_blend = c_purple;
		_incident.owner = self;
	}
}
else
{
	attack_charge = 0;
}


