var move = (keyboard_check(ord("D")) - keyboard_check(ord("A")));

hsp=move * move_speed;

if (!place_meeting(x + hsp, y, obj_block))
{
	x += hsp
} else
{
	hsp = 0;
}


vsp += grav;

// A descending player is snapped onto an enemy top when they are within
// ten pixels of it. This happens before ordinary collision damage.
var stomp_target = noone;
if (vsp > 0)
{
	stomp_target = collision_rectangle(bbox_left + 2, bbox_bottom, bbox_right - 2, bbox_bottom + vsp + 10, obj_cactus, false, true);
	if (stomp_target == noone)
	{
		stomp_target = collision_rectangle(bbox_left + 2, bbox_bottom, bbox_right - 2, bbox_bottom + vsp + 10, obj_chicken_enemy, false, true);
	}

	if (stomp_target != noone && bbox_bottom <= stomp_target.bbox_top + 10)
	{
		y += stomp_target.bbox_top - bbox_bottom;
		vsp = -jump_seed * 0.5;
		stomp_target.squashing = true;
	}
}


if (keyboard_check_pressed(vk_space))
{
  if (place_meeting(x, y+1, obj_block))
  {
	vsp = - jump_seed;
  }
}

if (!place_meeting(x, y + vsp, obj_block))
{
	y += vsp
} else
{
	vsp = 0;
}



if (vsp != 0)
{
	sprite_index = jump;
}
 else if (hsp !=0)
{
	sprite_index =run;
}else
{
	if (can_take_damage == false)
	{
		sprite_index = spr_player_take_damage;
	}else{
	sprite_index = spr_player_idle;}
}



if (hsp > 0) {image_xscale = +1}
if (hsp < 0) {image_xscale = -1}

if(hp <= 0) {
	// Keep the room and its current state intact; only the player is restored.
	x = checkpoint_x;
	y = checkpoint_y;
	hsp = 0;
	vsp = 0;
	hp = 3;
	coins = 0;
	can_take_damage = true;
	alarm[0] = -1;
}
