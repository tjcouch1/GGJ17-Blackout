///control_create()

globalvar key_left, key_right, key_up, key_down, key_jump;
key_left = ord("A");
key_right = ord("D");
key_up = ord("W");
key_down = ord("S");
key_jump = vk_space;

player = instance_create(obj_spawn.x, obj_spawn.y, obj_player)
player.owner = id;

death_time_cap = 1 * room_speed;
death_time = death_time_cap;

winroom = -1;

globalvar light;

starttime = room_speed * 5;

creditframe = 0;
credittimecap = room_speed * 2 / 3;
credittime = credittimecap;

winsound = -1;

audio_play_sound(snd_music, 1, true);
