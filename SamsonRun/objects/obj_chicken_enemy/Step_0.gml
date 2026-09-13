/// @description Walk on blocks and turn around at walls and ledges
if (squashing)
{
	image_xscale += 0.12;
	image_yscale = max(0.15, image_yscale - 0.16);
	if (image_yscale <= 0.15)
	{
		instance_create_layer(x, bbox_bottom - sprite_get_height(sprite_index) * 0.15, "Instances", obj_coin);
		instance_destroy();
	}
	exit;
}

// Gravity keeps the chicken on the platforms instead of letting it float.
vsp = min(vsp + grav, 10);

if (!place_meeting(x, y + vsp, obj_block))
{
	y += vsp;
}
else
{
	while (!place_meeting(x, y + sign(vsp), obj_block))
	{
		y += sign(vsp);
	}
	vsp = 0;
}

// Do not patrol while falling; resume as soon as the slime lands on a block.
if (place_meeting(x, y + 1, obj_block))
{
	var horizontal_move = move_speed * patrol_direction;

	// Turn around before entering a wall or walking off the current platform.
	if (place_meeting(x + horizontal_move, y, obj_block)
	|| !place_meeting(x + horizontal_move, y + 1, obj_block))
	{
		patrol_direction = -patrol_direction;
		horizontal_move = move_speed * patrol_direction;
	}

	// The wall check above ensures this move never passes through obj_block.
	if (!place_meeting(x + horizontal_move, y, obj_block))
	{
		x += horizontal_move;
	}
}

// The original slime faces left; mirror only its drawing while walking right.
visual_xscale = patrol_direction == -1 ? 1 : -1;
