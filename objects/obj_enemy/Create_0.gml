/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod
event_inherited()

hp = 1;
move_speed = 2.2;

step = choose(-1,-0.5,0,0.5,1);
step_tend = 1;

state = "wander"

notice_range = 64;

wander_x = room_width/2-x;
wander_y = room_height/2-y;

slow_strength = 0.85;

attack_charge = 0;
attack_time = obj_player.game_speed*1/2;

if(abs(wander_x)/room_width > abs(wander_y)/room_height)
{
	wander_x = sign(wander_x)
	wander_y = 0;
}
else
{
	wander_x = 0;
	wander_y = sign(wander_y);
}

