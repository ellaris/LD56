/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod

event_inherited();

max_slashes = 3;
available_slashes = max_slashes;
move_speed = 2;


game_speed = game_get_speed(gamespeed_fps);

slashing = false;
slash_cd = 0
slash_cd_max = game_speed*1/3;
slash_exhaust_time = game_speed*1/2;
slash_exhaust_charge = 0;
slash_range = 48;
slash_damage = 1;

exhausted = 0;
dead = false;

phantom = false;

// upgrades
slash_aoe = false;
slash_invisibility = false;
slash_phantom = false;

