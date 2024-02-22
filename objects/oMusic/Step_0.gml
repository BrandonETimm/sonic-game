if timer == 0 audio_play_sound(soundMusic1,0,false);
if timer < 1284 timer++
else
{
	audio_play_sound(soundMusic2,1,true);
	instance_destroy();
}
