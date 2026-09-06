/// @description Damage the cat once, then respect its invulnerability timer
if (other.can_take_damage)
{
	other.hp -= 1;
	other.can_take_damage = false;
	other.alarm[0] = 60;
}
