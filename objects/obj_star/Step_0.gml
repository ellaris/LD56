/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod



move_towards_point(target_x,target_y,speed);
speed += 0.04;
if(speed > 16)
	speed = 16;
direction += sin(1-x/30)*30*(1/speed)//(irandom(40)-20)*1

if(mouse_check_button_pressed(mb_any))
	speed = min(16,1+speed*2);

if(point_distance(x,y,target_x,target_y) <= 16)
{
	instance_destroy();
	if(add)
		obj_control.stars += 1;
}
