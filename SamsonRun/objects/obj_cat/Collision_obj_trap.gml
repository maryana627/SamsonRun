if (can_take_damage == true)
{
	sprite_index = spr_player_take_damage;
	hp -= 1;
	can_take_damage = false;
	alarm[0] = 55;
}

