///player_animate()

image_speed = 1 / 15;
if (xvel == 0)
{
    image_index = 0;
    sprite_index = spr_player_idle;
}
else 
{
    sprite_index = spr_player_walk;
    if (xvel >= 0)
        image_xsc = 1;
    else image_xsc = -1;
}

if (owner.winroom >= 0)
{
    if (owner.winroom == room_speed * 3)
        image_index = 0;
    sprite_index = spr_player_switch;
    image_speed = 1 / 20;
    image_xsc = 1;
    if (image_index == image_number - 1)
        image_speed = 0;
}
