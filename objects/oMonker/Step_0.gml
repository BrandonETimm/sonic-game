for (var i = 0; i <= 11; i++)
{
	if gamepad_is_connected(i)
	{
		controller = i;
		i=12;
	}
}

key_left = keyboard_check(ord("A")) || gamepad_button_check(controller,gp_padl) || gamepad_axis_value(controller,gp_axislh) < -0.3;
key_right = keyboard_check(ord("D")) || gamepad_button_check(controller,gp_padr) || gamepad_axis_value(controller,gp_axislh) > 0.3;
key_down = keyboard_check(ord("S")) || gamepad_button_check(controller,gp_padd) || gamepad_axis_value(controller,gp_axislv) > 0.15;
jump = keyboard_check_pressed(vk_space) || gamepad_button_check_pressed(controller,gp_face1) || gamepad_button_check_pressed(controller,gp_face2) || gamepad_button_check_pressed(controller,gp_face3) || gamepad_button_check_pressed(controller,gp_face4);
hold_jump = keyboard_check(vk_space) || gamepad_button_check(controller,gp_face1) || gamepad_button_check(controller,gp_face2) || gamepad_button_check(controller,gp_face3) || gamepad_button_check(controller,gp_face4);

move = key_right - key_left;

if !dead && goalT == 0
{
if !form == 0 jumpball = false;
if rings > 99 rings = 99;
if invinc > 0 invinc--;

if stundur == 0
{
	if abs(xsp) < walksp
	{
		xsp = walksp*move;
		if xsp == 0 ball = false;
	}
	else if move == 0
	{
		if ball
		{
			if xsp > 0 xsp = max(0,xsp-0.05);
			else xsp = min(0,xsp+0.05);
		}
		else
		{
			if xsp > 0 xsp = max(0,xsp-0.50);
			else xsp = min(0,xsp+0.50);
		}
	}
	else if sign(xsp) == sign(move)
	{
		if xsp > 0 xsp = min(runsp,xsp+0.15);
		else xsp = max(-runsp,xsp-0.15);
	}
	else
	{
		if xsp > 0 xsp = max(0,xsp-1);
		else xsp = min(0,xsp+1);
		ball = false;
	}
}
else
{
	stundur--;
	if xsp > 0 xsp = max(0,xsp-0.05);
	else xsp = min(0,xsp+0.05);
	
}

if  key_down && (abs(xsp) >= 6 || jump && xsp == 0) && place_meeting(x,y+1,oWall) && !ball
{
	ball = true;
	audio_stop_sound(soundCharge);
	audio_play_sound(soundCharge,1,false);
	if jump
	{
		jump = false;
		xsp = 6*image_xscale;
	}
}

if jump
{
	if place_meeting(x,y+1,oWall) 
	{
		ysp = -jumpsp;
		fly = flydur;
		if form == 0 jumpball = true;
		audio_play_sound(soundJump,1,false);
	}
	ball = false;
}

if hold_jump && !place_meeting(x,y+1,oWall) 
{	
	if form == 2  && ysp > 0 
	{
		ysp = grv;
		animate = false;
		sprite_index = sKnucklesGlide;
		
	}
	else if form == 1 && fly > 0 && ysp > -1
	{
		ysp = -1;
		fly--;
		animate = false;
		sprite_index = sTailsFly;
		image_speed = 15;
	}
	else animate = true;
}
else animate = true;

ysp = min(ysp+grv,8);

//horizontal movement

if (place_meeting(x,y+ysp,oWall))
{
	while(!place_meeting(x,y+sign(ysp),oWall))
	{
		y+=sign(ysp);
	}
	if !(place_meeting(x,y+ysp,oBounce)) && !place_meeting(x,y-1,oWall) jumpball = false;
	ysp=0;
}

y += ysp;

if (place_meeting(x+xsp,y,oWall))
{	
	if (place_meeting(x+1*sign(xsp),y,oSlope))
	{
		xsp = xsp div 1.8;
		if (place_meeting(x+1*sign(xsp),y,oJSlope)) ysp = -xsp div 1.8;
		x+=xsp;	
	}
	else
	{
		while(!place_meeting(x+sign(xsp),y,oWall))
		{
			x+=sign(xsp);
		}
		if !((place_meeting(x+xsp,y,oBounce)) && (ball || jumpball)) xsp=0;
	}
}

if !(place_meeting(x+xsp,y,oBounce)) x += xsp;

while(place_meeting(x,y,oWall))
{
	y-=1;
}

if move != 0
{
	image_xscale = move;
}
if animate
{
	if ball || jumpball
	{
		if form == 0 sprite_index = sMonkerBall;
		else if form == 1 sprite_index = sTailsBall;
		else sprite_index = sKnucklesBall;
		image_speed = 10 + xsp*2;
	}
	else if abs(xsp) >= runsp
	{	
		if form == 0 sprite_index = sMonkerRun;
		else if form == 1 sprite_index = sTailsRun;
		else sprite_index = sKnucklesRun;
		image_speed = 20;
	}
	else if abs(xsp) > 0
	{
		if form == 0 sprite_index = sMonkerWalk;
		else if form == 1 sprite_index = sTailsWalk;
		else sprite_index = sKnucklesWalk;
		image_speed = 10 + xsp*2;
	}
	else
	{
		if form == 0 sprite_index = sMonker;
		else if form == 1 sprite_index = sTails;
		else sprite_index = sKnuckles;
	}
}
}
else if dead
{
	ysp = min(ysp+grv,8);
	y += ysp;
	sprite_index = sMonker;
	audio_stop_sound(soundMusic1);
	audio_stop_sound(soundMusic2);
}
else
{
	ysp = min(ysp+grv,8);
	x+=xsp;
	y += ysp;
	sprite_index = sMonkerWalk;
	image_xscale = 1;
	goalT++;
	if (place_meeting(x,y+ysp,oWall))
	{
		while(!place_meeting(x,y+sign(ysp),oWall))
		{
			y+=sign(ysp);
		}
		ysp=0;
	}
	if goalT = 90
	{
		audio_stop_sound(soundMusic1);
		audio_stop_sound(soundMusic2);
		room_goto_next();
	}
}
if y > room_height + 150
{
	audio_stop_sound(soundMusic1);
	audio_stop_sound(soundMusic2);
	room_restart();
}