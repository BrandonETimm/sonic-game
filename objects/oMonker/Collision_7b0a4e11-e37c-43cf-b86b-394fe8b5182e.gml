if jumpball || ball 
{
	instance_destroy(other);
	if jumpball ysp = -2;
}
else if invinc == 0 && !dead
{
	rings = min(20,rings)
	if rings > 0
	{
		while rings > 0 
		{
			rings--;
			instance_create_layer(x,y,"Rings",oBounceRing);
		}
		ysp = -4;
		xsp = -4*image_xscale;
		stundur = 40;
		audio_play_sound(soundDamage,1,false);
	}
	else
	{
		dead = true;
		ysp = -5;
	}
	invinc = 120;
}