if place_meeting(x,y-1,oMonker) && !destroyed && (oMonker.ball || oMonker.jumpball)
{
	oMonker.ysp = -4;
	sprite_index = sDestroyedBox;
	destroyed = true;
	audio_play_sound(soundDestroy,1,false);
}
else if place_meeting(x+1,y,oMonker) && !destroyed && (oMonker.ball || oMonker.jumpball)
{
	oMonker.xsp = min(oMonker.xsp+2,0);
	sprite_index = sDestroyedBox;
	destroyed = true;
	audio_play_sound(soundDestroy,1,false);
}
else if place_meeting(x-1,y,oMonker) && !destroyed && (oMonker.ball || oMonker.jumpball)
{
	oMonker.xsp = max(oMonker.xsp-2,0);
	sprite_index = sDestroyedBox;
	destroyed = true;
	audio_play_sound(soundDestroy,1,false);
}