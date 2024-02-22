if place_meeting(x+xsp,y,oTurn) xsp = -xsp;

if (place_meeting(x+xsp,y,oTurn))
{	
	while !(place_meeting(x+sign(xsp),y,oTurn)) 
	{
		x+=sign(xsp);
	}
	turnaround = true;
}

if !turnaround x += xsp;
turnaround =false;
if place_meeting(x,y-1,oMonker) oMonker.x += xsp;	