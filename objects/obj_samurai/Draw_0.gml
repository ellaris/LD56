/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod



draw_text(x,bbox_top-10,string("s{0} cd{1} ec{2} e{3} d{4} p{5}",available_slashes, slash_cd, slash_exhaust_charge, exhausted, dead, paused))
draw_self()

draw_set_color(c_white);
draw_circle(x,y,slash_range,true);