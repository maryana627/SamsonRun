/// @description Touching the cactus hurts unless it is already being stomped.
if (!squashing && other.can_take_damage)
{
    other.hp -= 1;
    other.can_take_damage = false;
    other.alarm[0] = 60;
}
