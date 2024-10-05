/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod

var _slow_mow = (1- (slow_strength *obj_player.slashing));
var _ms = move_speed * _slow_mow;

if( hp <= 0)
	instance_destroy();
	
if(state == "wander")
{
	var _dist = distance_to_object(obj_player);
	if(_dist <= notice_range)
	with(obj_enemy)
		state = "chase"
	
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
		attack_charge = 0;
		obj_player.dead = true;
		instance_create_layer(x,y,layer,obj_attack);
	}
}
else
{
	attack_charge = 0;
}


