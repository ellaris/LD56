/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod

draw_set_valign(fa_middle);
var _xx = 32;
var _yy = 32;

if(room != rm_start)
{
	draw_text(_xx-8,_yy-22,"Bonus Objectives");
	for(var i = 0; i < array_length(level_challenges); i++)
	{
		var _chall = level_challenges[i];
		draw_sprite(spr_checkbox, 1+_chall.value, _xx, _yy);
		draw_text(_xx+20,_yy,_chall.text);
		_yy += 32;
	}
}
else
{
	// display stars
	draw_text(view_wport-32,32,string(stars));
	
	
	// display level "buttons"
	for(var i = 0; i < array_length(level_stars); i++)
	{
		_xx = i*96;
		var _hover = point_in_rectangle(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),_xx+32,64,_xx+32+96,64+64)
		var _stars = level_stars[i];
		var _last_stars = 1;
		if(i > 0)
			_last_stars = level_stars[i-1];
			
		if(_last_stars and _hover)
		{
			draw_set_color(c_grey);
			draw_rectangle(_xx+32,64,_xx+32+96,64+64,false);
		}
		// active / inactive colors
		draw_set_color(c_dkgrey)
		if(_last_stars)
			draw_set_color(c_ltgray)
		
		draw_rectangle(_xx+32,64,_xx+32+96,64+64,true);
		
		draw_text(_xx+32+8,64+12,"Level "+string(1+i));
		// draw obtained stars
		for(var j = 0; j < _stars; j++)
			draw_sprite(spr_star,0,32+_xx+14+26*j,64+32+12);
		
	
		//if( point_in_rectangle(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),_xx+64,64,_xx+64,64+64))
		//	draw_circle(room_width-32,room_height-32,18,false);
		if(_last_stars and mouse_check_button_pressed(mb_left) and _hover)
		{
			current_level = i;
			room_goto(asset_get_index("rm_level"+string(1+i)));
		}
	}
	
	// display shop "buttons"
	upgrade_range.draw(view_wport-256-128,32);
	
	// display options audo sliders and touch screen support
	
	// character select
}
draw_set_color(c_white);


//draw_set_halign(fa_center);


