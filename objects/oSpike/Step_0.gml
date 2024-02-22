if oMonker.invinc == 0 && !oMonker.dead && (image_angle == 0 && place_meeting(x,y-1,oMonker) || image_angle == 180 && place_meeting(x,y+1,oMonker) || image_angle == 90 && place_meeting(x-1,y,oMonker) || image_angle == 270 && place_meeting(x+1,y,oMonker))
{
	
	oMonker.rings = min(20,oMonker.rings)
	if oMonker.rings > 0
	{
		while oMonker.rings > 0 
		{
			oMonker.rings--;
			instance_create_layer(oMonker.x,oMonker.y,"Rings",oBounceRing);
		}
		oMonker.ysp = -4;
		oMonker.xsp = -4*image_xscale;
		oMonker.ball = false;
		oMonker.jumpball = false;
		oMonker.stundur = 40;
		audio_play_sound(soundDamage,1,false);
	}
	else
	{
		oMonker.dead = true
		oMonker.ysp = -5;
	}
	oMonker.invinc = 120;	
}