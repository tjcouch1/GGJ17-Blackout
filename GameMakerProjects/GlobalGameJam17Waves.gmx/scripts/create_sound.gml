///create_sound(x, y, num, life)
//life is in seconds

var xcreate = argument0;
var ycreate = argument1;
var num = argument2;
var life = argument3 * room_speed;

var part, angle;
var anglemod = irandom(360);
for (var i = 0; i < num; i++)
{
    part = instance_create(xcreate, ycreate, obj_sound);
    angle = 360 * i / num;
    part.xvel = lengthdir_x(5, angle + anglemod);
    part.yvel = lengthdir_y(5, angle + anglemod);
    part.lifecap = life;
}
