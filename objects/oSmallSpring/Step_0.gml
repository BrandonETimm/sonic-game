if !oMonker.dead
{
if image_angle == 0 && place_meeting(x,y-1,oMonker)
{
	oMonker.ysp = -8;
	audio_stop_sound(soundSpring);
	audio_play_sound(soundSpring,1,false);
}
else if image_angle == 180 && place_meeting(x,y+1,oMonker)
{
	oMonker.ysp = 8;
	audio_stop_sound(soundSpring);
	audio_play_sound(soundSpring,1,false);
}
else if image_angle == 90 && place_meeting(x-1,y,oMonker)
{
	oMonker.xsp = -12;
	audio_stop_sound(soundSpring);
	audio_play_sound(soundSpring,1,false);
}
else if image_angle == 270 && place_meeting(x+1,y,oMonker)
{
	oMonker.xsp = 12;
	audio_stop_sound(soundSpring);
	audio_play_sound(soundSpring,1,false);
}
}