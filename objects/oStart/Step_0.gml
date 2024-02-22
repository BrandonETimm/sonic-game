for (var i = 0; i <= 11; i++)
{
	if gamepad_is_connected(i)
	{
		controller = i;
		i=12;
	}
}
if keyboard_check_pressed(vk_space) || gamepad_button_check_pressed(controller,gp_face1) || gamepad_button_check_pressed(controller,gp_face2) || gamepad_button_check_pressed(controller,gp_face3) || gamepad_button_check_pressed(controller,gp_face4) 
{
	audio_stop_sound(soundMusic1);
	audio_stop_sound(soundMusic2);
	room_goto_next();
}