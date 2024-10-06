/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod

if(obj_control.show_ranges)
{
	draw_set_color(c_lime);
	draw_set_alpha(0.1);
	draw_circle(x,y,slash_range,false);
	draw_set_alpha(1);
}

//draw_text(x,bbox_top-10,string("s{0} cd{1} ec{2} e{3} d{4} p{5}",available_slashes, slash_cd, slash_exhaust_charge, exhausted, dead, paused))
draw_self()

if(slashing or dead or exhausted)
{
	draw_set_color(c_red);
	if(slash_exhaust_charge >= slash_exhaust_time-8 or exhausted)
		draw_set_color(c_olive);
	if(dead)
		draw_set_color(c_fuchsia);
	draw_set_alpha(0.05);
	draw_rectangle(0,0,room_width,room_height,false);
	draw_set_alpha(1);
}

draw_set_color(c_white);
