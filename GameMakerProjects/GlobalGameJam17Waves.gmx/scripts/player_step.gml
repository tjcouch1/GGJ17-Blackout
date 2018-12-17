///player_step()

if (alive)
{
    var ladder_below = place_meeting(x, y + 1, obj_ladder);
    if  ((keyboard_check(key_up) || keyboard_check(key_down)) && ladder_below)
        climb = true;
    if (climb && !ladder_below)
        climb = false;
        
        
    if (place_meeting(x, y + 1, obj_terrain) || (!place_meeting(x, y, obj_ladder) && ladder_below && climb))
        ground = true;
    else 
    {
        ground = false;
        if (!climb)
            yvel += yacc;
    }
    
    if (ground && keyboard_check(key_down) && place_meeting(x, y + 1, obj_terrain))
        climb = false;
    
    var xdir = 0;
    if (keyboard_check(key_right))
        xdir++;
    if (keyboard_check(key_left))
        xdir--;
    
    if (xdir != 0)
    {
        if (!place_meeting(x + 1 * xdir, y, obj_crate))
        {
            xvel += xacc * xdir;
            xmax = xmaxwalk;
            pushing = false;
            if (instance_exists(obj_crate))
                obj_crate.push = false;
        }
        else if (ground)
        {
            var crate;
            for (var i = 0; i < instance_number(obj_crate); i++)
            {
                crate = instance_find(obj_crate, i);
                if (crate.pushable && place_meeting(x + 1 * xdir, y, crate))
                {
                    xmax = crate.xmax;
                    //crate.push = true;
                    //pushing = true;
                    with (crate)
                        if (!place_meeting(x + 1 * xdir, y, obj_terrain))
                        {
                            push = true;
                            other.pushing = true;
                        }
                        else
                        {
                            push = false;
                            other.pushing = false;
                        }
                    xvel += crate.xacc * xdir;
                }
            }
        }
    }
    else
    {
        xvel *= xdec;
        if (abs(xvel) <= .1)
            xvel = 0;
        
        pushing = false;
        if (instance_exists(obj_crate))
        obj_crate.push = false;
    }
    
    if (keyboard_check(key_jump) && (ground || climb))
    {
        if (ground)
            yvel = jumpvel;
        else yvel = climbdismountvel;
        ground = false;
        climb = false;
    }
    
    if (climb)
    {
        if (keyboard_check(key_up) && !keyboard_check(key_down))
            yvel = climbvel;
        else if (keyboard_check(key_down) && !keyboard_check(key_up))
            yvel = -climbvel;
        else yvel = 0;
    }

}
