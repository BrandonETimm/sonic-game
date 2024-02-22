if place_meeting(x+xsp,y,oTurn) xsp = -xsp;

if (place_meeting(x+xsp,y,oTurn))
{	
	while !(place_meeting(x+sign(xsp),y,oTurn)) 
	{
		x+=sign(xsp);
	}
	turnaround = true;
}

if iFrames > 0 iFrames--;
if hp == 0 instance_destroy();
if spikeT < spikeDelay spikeT++;
else
{
	spikeT = 0;
	instance_create_layer(x,y,"Walls",oSpikeThrow);
}

if !turnaround x += xsp;
turnaround =false;

image_xscale = sign(xsp);