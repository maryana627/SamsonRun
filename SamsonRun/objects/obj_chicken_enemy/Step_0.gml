/// @description Patrol between walls (and turn before an open edge).
hsp = move_speed * direction_x;

// A wall ahead marks the end of this patrol section. The open-edge check is
// only meaningful while the chicken is standing on an obj_blok.
var is_grounded = place_meeting(x, y + 1, obj_blok);
if (place_meeting(x + hsp, y, obj_blok) || (is_grounded && !place_meeting(x + hsp, y + 1, obj_blok)))
{
    direction_x = -direction_x;
    hsp = move_speed * direction_x;
}

if (!place_meeting(x + hsp, y, obj_blok))
{
    x += hsp;
}

vsp += gravity;
var vertical_steps = ceil(abs(vsp));
var vertical_direction = sign(vsp);

// Test every pixel of vertical motion. This prevents the enemy from
// tunnelling through a thin or scaled obj_blok when its falling speed rises.
repeat (vertical_steps)
{
    if (!place_meeting(x, y + vertical_direction, obj_blok))
    {
        y += vertical_direction;
    }
    else
    {
        vsp = 0;
        break;
    }
}

image_xscale = direction_x;
