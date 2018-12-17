///player_create()

owner = -1;

//movement
xvel = 0;
yvel = 0;

xmaxwalk = 6;
xmax = xmaxwalk;
ymax = 20;

jumpvel = -10;
climbvel = -4;
climbdismountvel = -5;

xacc = .3;
yacc = .5;

xdec = .7;

xprev = 0;
yprev = 0;

//status
groud = false;
climb = false;
alive = true;
pushing = false;

image_xsc = 1;

mask_index = spr_player_idle;

walktimecap = room_speed / 8;
walktime = walktimecap;
