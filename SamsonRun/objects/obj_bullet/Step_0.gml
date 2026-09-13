life -= 1;
if (life <= 0 || x < -32 || x > room_width + 32)
{
    instance_destroy();
}
