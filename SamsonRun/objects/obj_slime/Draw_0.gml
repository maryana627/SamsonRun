/// @description Draw the slime without mirroring its collision mask
var draw_x = x;

// spr_slime has a top-left origin, so shift the mirrored image back over its mask.
if (visual_xscale == -1)
{
	draw_x += sprite_get_width(sprite_index) * image_xscale;
}

draw_sprite_ext(sprite_index, image_index, draw_x, y, visual_xscale * image_xscale, image_yscale, 0, c_white, 1);
