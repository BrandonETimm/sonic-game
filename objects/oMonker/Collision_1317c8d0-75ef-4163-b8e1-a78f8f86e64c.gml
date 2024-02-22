if other.pickupT == 0 && !dead
{
	instance_destroy(other);
	rings++;
	audio_play_sound(soundRing,1,false);
}