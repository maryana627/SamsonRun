var move = (keyboard_check(ord("D")) - keyboard_check(ord("A")));

hsp=move * move_speed;

if (!place_meeting(x + hsp, y, obj_blok))
{
	x += hsp
} else
{
	hsp = 0;
}


vsp += grav;


if (keyboard_check_pressed(vk_space))
{
  if (place_meeting(x, y+1, obj_blok))
  {
	vsp = - jump_seed;
  }
}

if (!place_meeting(x, y + vsp, obj_blok))
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
	sprite_index = spr_player_idle;
}



if (hsp > 0) {image_xscale = +1}
if (hsp < 0) {image_xscale = -1}

if(hp <= 0) {
room_restart();
}