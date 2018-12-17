///player_end_step()

xprev = x;
yprev = y;

if (alive)
{
    if (owner.winroom < 0)
    {
        if (xvel == 0)
            x = round(x);
        
        if (xvel > xmax)
            xvel = xmax;
        if (xvel < -xmax)
            xvel = -xmax;
            
        if (yvel > ymax)
            yvel = ymax;
        
        if (!place_meeting(x + xvel, y, obj_terrain))
            x += xvel;
        else
        {
            var block;
            var stepmove = false;
            for (var i = 0; i < instance_number(obj_terrain); i++)
            {
                block = instance_find(obj_terrain, i);
                if (place_meeting(x + xvel, y, block))
                {
                    if (block.object_index == obj_crate || block.object_index == obj_crate_large)
                    {
                        if (!block.push)
                        {
                            block.x = round(block.x);
                            stepmove = true;
                        }
                        else
                        {
                            var xmov = block_move(block, xvel, 0);
                            var side = 0;
                            var dir = -1;
                            if (xmov < 0)
                            {
                                side = 1;
                                dir = 1;
                            }
                            
                            if (xmov != 0)
                                x  = block.x + block.sprite_width * side + (bbox_right + 1 - bbox_left) / 2 * dir;
                        }
                    }
                    else stepmove = true;
                }
            }
            
            if (stepmove)
            {
                x = round(x);
                while (!place_meeting(x + 1 * xvel / abs(xvel), y, obj_terrain))
                    x += 1 * xvel / abs(xvel);
                xvel = 0;
            }
        }
        
        if (!place_meeting(x, y + yvel, obj_terrain) && (!climb || place_meeting(x, y + 1 + yvel, obj_ladder)))
            y += yvel;
        else
        {
            y = round(y);
            while (!place_meeting(x, y + 1 * yvel / abs(yvel), obj_terrain) && (!climb || place_meeting(x, y + 1 + 1 * yvel / abs(yvel), obj_ladder)))
                y += 1 * yvel / abs(yvel);
            
            if (yvel > 0)
            {
                create_sound(x, y + sprite_height / 2, 36, 3);
                audio_play_sound(snd_land, .5, false);
            }
            
            yvel = 0;
        }
        
        if ((ground || climb) && (abs(xvel) > 0 || abs(yvel) > 0))
        {
            walktime--;
            if (walktime <= 0)
            {
                walktime = walktimecap;
                create_sound(x, y + sprite_height / 2 - 2, 10, 1);
                if (climb)
                    audio_play_sound(snd_ladder, .5, false);
                else audio_play_sound(snd_walk, .5, false);
            }
        }
        else walktime = 1;
    }
    
    player_animate();
    
    if (place_meeting(x, y, obj_saw))
        player_die();
}
