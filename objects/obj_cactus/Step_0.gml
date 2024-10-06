/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod



var _enemy = instance_place(x,y,obj_enemy);
if(_enemy)
{
	_enemy.hp -=1;
	_enemy.push_direction = point_direction(x,y,_enemy.x,_enemy.y);
	_enemy.push_strength = 2;
	audio_play_sound(snd_bounce,3,false);
	if(_enemy.hp <= 0)
		kills += 1;
	direction += (irandom(1)-0.5)*30;
	grow += 0.1;
}

var _player = instance_place(x,y,obj_player);
if(_player)
{
	//_enemy.hp -=1;
	//if(_player.push_strength <= 3.8)
	_player.push_direction = point_direction(x,y,_player.x,_player.y);
	_player.push_strength = 4;
	audio_play_sound(snd_bounce,3,false);
	//if(_enemy.hp <= 0)
	//	kills += 1;
	direction += (irandom(1)-0.5)*30;
	grow += 0.1;
}

image_angle += angle_difference(direction,image_angle)/10;

if(direction != 0)
{
	direction += angle_difference(0,direction)/50;
}

if(grow > 0 and image_xscale < 1+grow)
{
	image_xscale += 0.025;
	image_yscale += 0.025;
}
else if(image_xscale > 1)
{
	grow = 0;
	image_xscale -= 0.01;
	image_yscale -= 0.01;	
}