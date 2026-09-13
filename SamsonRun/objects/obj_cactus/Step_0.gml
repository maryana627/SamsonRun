/// @description Shoot at the player within a 100-pixel horizontal sight range
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

// Stay on the first frame while idle; each shot plays the sprite once.
if (image_speed > 0 && image_index >= image_number - 1)
{
    image_index = 0;
    image_speed = 0;
}

shoot_cooldown = max(0, shoot_cooldown - 1);
var player = instance_nearest(x, y, obj_cat);

if (player != noone && abs(player.x - x) <= 100 && shoot_cooldown <= 0)
{
    var shoots_left = player.x < x;
    var bullet_x = shoots_left ? bbox_left - 8 : bbox_right;
    var bullet_y = (bbox_top + bbox_bottom) * 0.5;
    var bullet = instance_create_layer(bullet_x, bullet_y, "Instances", obj_bullet);
    bullet.direction = shoots_left ? 180 : 0;
    bullet.speed = 5;
    bullet.image_xscale = bullet.direction == 180 ? -1 : 1;
    shoot_cooldown = shoot_interval;

    image_index = 0;
    image_speed = 0.2;
}
