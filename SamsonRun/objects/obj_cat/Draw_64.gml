

for (var i =0; i < hp; i ++) {
	draw_sprite(spr_hp, 0, 20 + i * 45, 20);
}

draw_sprite(coin, 0, 1250, 30);
draw_set_colour(c_black);
draw_set_font(fnt_basik);
draw_text(1300, 29, string(coins));