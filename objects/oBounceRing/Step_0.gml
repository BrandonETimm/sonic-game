if pickupT > 0 pickupT--;

if duration > 0 duration--;
else instance_destroy();

ysp += grv;

if (place_meeting(x+xsp,y,oWall))
{	
	while(!place_meeting(x+sign(xsp),y,oWall))
	{
		x+=sign(xsp);
	}
	 xsp=-xsp+1*sign(xsp);
	bouncedx = true
}

if !bouncedx x += xsp;

//horizontal movement

if (place_meeting(x,y+ysp,oWall))
{
	while(!place_meeting(x,y+sign(ysp),oWall))
	{
		y+=sign(ysp);
	}
	ysp=-ysp+1;
	bouncedy = true;
}

if !bouncedy y += ysp;

bouncedx = false;
bouncedy = false;
