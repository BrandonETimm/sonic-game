if jumpball && oBoss.iFrames <= 0
{
	oBoss.hp--;
	oBoss.iFrames = 240;
	ysp = -4;
	xsp = -16;
	audio_play_sound(soundDestroy,1,false);
	instance_destroy(oBounce);
	instance_create_layer(56,392,"Walls",oTransformK);
	instance_create_layer(360,472,"Walls",oTransformT);
	instance_create_layer(472,120,"Walls",oTransformM);
}
else if invinc == 0 && !dead && !jumpball
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