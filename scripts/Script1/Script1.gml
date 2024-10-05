// W wersji v2.3.0 zmieniono zasoby skryptu. Więcej informacji można znaleźć pod adresem
// https://help.yoyogames.com/hc/en-us/articles/360005277377
function Script1(){

}

function create_star(_cx,_cy,_tx = room_width-16, _ty = 16, _add = true)
{
	var _star = instance_create_layer(_cx,_cy,"Instances",obj_star);
	_star.add = _add;
	_star.target_x = _tx;
	_star.target_y = _ty;
}