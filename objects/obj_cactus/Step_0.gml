/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod



var _enemy = instance_place(x,y,obj_enemy);
if(_enemy)
{
	_enemy.hp -=1;
	_enemy.push_direction = point_direction(x,y,_enemy.x,_enemy.y);
	_enemy.push_strength = 4;
	if(_enemy.hp <= 0)
		kills += 1;
}
