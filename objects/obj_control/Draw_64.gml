/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod

draw_set_valign(fa_middle);
var _xx = 32;
var _yy = 32;
for(var i = 0; i < array_length(level_challenges); i++)
{
	var _chall = level_challenges[i];
	draw_sprite(spr_checkbox, 1+_chall.value, _xx, _yy);
	draw_text(_xx+20,_yy,_chall.text);
	_yy += 32;
}


//draw_set_halign(fa_center);


