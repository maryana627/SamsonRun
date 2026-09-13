/// @description Deal one hit, using the player's existing invulnerability timer.
if (!squashing && other.can_take_damage)
{
    other.sprite_index = spr_player_take_damage;
    other.hp -= 1;
    other.can_take_damage = false;
    other.alarm[0] = 55;
}
