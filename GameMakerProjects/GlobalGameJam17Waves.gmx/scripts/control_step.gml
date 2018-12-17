//control_step()

starttime--;

if (!player.alive)
{
    player.visible = false;
    death_time--;
    
    if (death_time <= 0)
    {
        player_reset(player);
        death_time = death_time_cap;
        room_restart();
    }
}
else
{
    death_time = death_time_cap;
    
    var win = false;
    
    if (winroom < 0)
        with (player)
            if (place_meeting(x, y, obj_switch))
            {
                win = true;
                var sw = instance_place(x, y, obj_switch);
                sw.image_speed = 1 / 20;
            }
    
    if (win && winroom < 0)
    {
        winroom = room_speed * 2;
        winsound = audio_play_sound(snd_win, .5, false);
    }
    if (winroom > 0)
        winroom--;
    
    if (winroom == 0)
            if (room_next(room) != -1)
                room_goto(room_next(room));
            else room_restart();
}

if (room == rm_credits && creditframe < 21)
{
    credittime--;
    if (credittime <= 0)
    {
        credittime = credittimecap;
        creditframe++;
    }
}
