/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod


//draw_self()

draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle+sign(step)*3,image_blend,image_alpha);
if(obj_control.show_ranges)
{
	draw_set_color(c_yellow);
	draw_circle(x,y,notice_range,true);
}