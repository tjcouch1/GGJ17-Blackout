///block_move(block, xvel, yvel) returns int
//returns and integer of how far it moves in the greater axis of velocity

var block = argument0;
var xvel = argument1;
var yvel = argument2;

var distx = 0;
var disty = 0;

with (block)
{
    if (!place_meeting(x + xvel, y, obj_terrain))
    {
        x += xvel;
        distx += xvel;
    }
    else 
    {
        distx += round(x) - x;
        x = round(x);
        while (!place_meeting(x + 1 * xvel / abs(xvel), y, obj_terrain))
        {
            x += 1 * xvel / abs(xvel);
            distx += 1 * xvel / abs(xvel);
        }
    }
    
    if (!place_meeting(x, y + yvel, obj_terrain))
    {
        y += yvel;
        disty += yvel;
    }
    else
    {
        disty += round(y) - y;
        y = round(y);
        while (!place_meeting(x, y + 1 * yvel / abs(yvel), obj_terrain))
        {
            y += 1 * yvel / abs(yvel);
            disty += 1 * yvel / abs(yvel);
        }
    }
    if (ground && (abs(distx) > 0 || abs(disty) > 0))
    {
        walktime--;
        if (walktime <= 0)
        {
            var dir = 1;
            if (distx < 0)
                dir = 0;
            walktime = walktimecap;
            create_sound(x + sprite_width * dir, y + sprite_height - 2, 36, 3);
            
            if (movesound < 0)
                movesound = audio_play_sound(snd_blockmove, .5, true);
        }
    }
    else walktime = 1;
}




if (abs(xvel) > abs(yvel))
    return distx;
else return disty;
