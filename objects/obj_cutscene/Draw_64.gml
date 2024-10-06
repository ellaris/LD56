/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod

array_foreach(figures, function(_e, _i){
	var _t = transfer(time-_e.time);
	var _xx = _e.x*sin(_t);
	var _yy = _e.y+cos(time*20)*16;
	draw_set_alpha(_t)
	draw_set_color(c_dkgrey);
	draw_line(_xx,_yy,_xx,view_hport[0]);
	draw_sprite_ext(_e.sprite,0,_xx,_yy,2,2,cos(time*4),c_white,_t);
	
})

draw_set_alpha(1);
draw_set_color(c_white);