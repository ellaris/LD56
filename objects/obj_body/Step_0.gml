/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod

event_inherited();

var _slow_mow = (1- (slow_strength *obj_player.slashing));

image_alpha -= 0.01*_slow_mow;
if(image_alpha <= 0)
	instance_destroy()

