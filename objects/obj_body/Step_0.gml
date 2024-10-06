/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod

event_inherited();

var _slow_mow = (1- (slow_strength *obj_player.slashing));

image_alpha -= 0.01*_slow_mow;

if(image_alpha < 0.55 and not exploded)
{
	exploded = true;
	audio_play_sound(snd_hit,2,false);
	// particles
	part_particles_create(obj_control.part_system,x,y,obj_control.part_type_blood,10);
}


if(image_alpha <= 0)
	instance_destroy()

