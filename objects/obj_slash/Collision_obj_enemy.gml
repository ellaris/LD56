/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod

if(obj_player.slash_aoe and image_alpha > 0.95 and not ds_list_find_index(hit, other.id))
{
	other.hp -= obj_player.slash_damage;
	ds_list_add(hit, other.id);
}


