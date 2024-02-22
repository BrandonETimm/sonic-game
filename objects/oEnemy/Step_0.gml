if place_meeting(x+xsp,y,oWall) xsp = -xsp;
else if !place_meeting(x+xsp+16*sign(xsp),y+1,oWall) xsp = -xsp;

if (place_meeting(x+xsp,y,oWall))
{	
	while !(place_meeting(x+sign(xsp),y,oWall)) 
	{
		x+=sign(xsp);
	}
	turnaround = true;
}

if !turnaround x += xsp;
turnaround =false;

//horizontal movement

ysp += grv;

if (place_meeting(x,y+ysp,oWall))
{
	while(!place_meeting(x,y+sign(ysp),oWall))
	{
		y+=sign(ysp);
	}
	ysp=0;
}

y += ysp;

image_xscale = sign(xsp);