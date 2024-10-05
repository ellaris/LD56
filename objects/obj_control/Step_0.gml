/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod


if(keyboard_check(ord("R")))
	game_restart();


for(var i = 0; i < array_length(level_challenges); i++)
{
	var _chall = level_challenges[i]
	if(_chall.value == 0)
	_chall.value = _chall.check()
}
