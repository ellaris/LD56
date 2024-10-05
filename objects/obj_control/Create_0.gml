/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod

function challenge(_text, _check) constructor {
	value = 0;
	text = _text;
	check_function = _check;
	
	check = function()
	{
		return(method_call(check_function,[]));
	}
}



//challenge_1_slash = 0;

//text_challenge_1_slash = "Kill all enemies using only 1 slash"

check_challenge_1_slash = function()
{
	var _val = 0;
	if(instance_number(obj_enemy) > 0 and (obj_player.available_slashes < obj_player.max_slashes-1))
		_val = -1;
	if(instance_number(obj_enemy) == 0 and obj_player.available_slashes >= obj_player.max_slashes-1)
		_val = 1;
	return(_val)
}

check_challenge_2_cactus_kills = function()
{
	var _val = 0;
	var _kill_count = 0;
	with(obj_cactus)
		_kill_count += kills;
	if(instance_number(obj_enemy) < 2-_kill_count)
		_val = -1;
	if(_kill_count >= 2)
		_val = 1;
	return(_val)
}

challenge_1_slash = new challenge("Kill all enemies using only 1 slash", check_challenge_1_slash);
challenge_2_cactus_kills = new challenge("Kill 2 enemies using a cactus", check_challenge_2_cactus_kills);

level_challenges = [challenge_1_slash, challenge_2_cactus_kills]