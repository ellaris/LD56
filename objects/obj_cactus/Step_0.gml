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
}
