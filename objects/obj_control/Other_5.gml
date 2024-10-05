/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod


if(room != rm_start)
{
	var _stars = 0;
	if(not instance_exists(obj_enemy))
	{
		_stars += 1 + sign((level_challenges[0].value+1)/2) + sign((level_challenges[1].value+1)/2);
		var _old_stars = level_stars[current_level];
		var _new_stars = _stars-_old_stars;
		if(_new_stars)
		{
			if(not _old_stars)
			{
				//var _star = instance_create_layer(obj_player.x,obj_player.y,layer,obj_star);
				//_star.add = true;
				//_star.target_x = room_width-32;
				//_star.target_y = 32;
				create_star(obj_player.x,obj_player.y);
				_new_stars -= 1;
			}
			
			repeat _new_stars
			{
				//var _star = instance_create_layer(32+irandom(16),32+_new_stars*32+irandom(16),layer,obj_star);
				//_star.add = true;
				//_star.target_x = room_width-32;
				//_star.target_y = 32;
				create_star(32+irandom(16),32+_new_stars*32+irandom(16));
				_new_stars--
			}
		}
		
		if(_old_stars < _stars)
			level_stars[current_level] = _stars;
	}
	
}

