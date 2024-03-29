if(!moving_block)
{
	visible = true;
	if(keyboard_check_pressed(vk_up) && y > 3)
	{
		y -= 6;
		press_time = current_time;
		cursor_move_time = 300;
	}
	else if(keyboard_check_pressed(vk_down) && y < 75)
	{
		y += 6;
		press_time = current_time;
		cursor_move_time = 300;
	}
	else if(keyboard_check_pressed(vk_left) && x > 3)
	{
		x -= 6;
		press_time = current_time;
		cursor_move_time = 300;
	}
	else if(keyboard_check_pressed(vk_right) &&  x < 42)
	{
		x += 6;
		press_time = current_time;
		cursor_move_time = 300;
	}
	else if(keyboard_check(vk_up) && y > 3 && current_time > press_time + cursor_move_time)
	{
		y -= 6;
		press_time = current_time;
		cursor_move_time = 100;
	}
	else if(keyboard_check(vk_down) && y < 75 && current_time > press_time + cursor_move_time)
	{
		y += 6;
		press_time = current_time;
		cursor_move_time = 100;
	}
	else if(keyboard_check(vk_left) && x > 3 && current_time > press_time + cursor_move_time)
	{
		x -= 6;
		press_time = current_time;
		cursor_move_time = 100;
	}
	else if(keyboard_check(vk_right) &&  x < 42 && current_time > press_time + cursor_move_time)
	{
		x += 6;
		press_time = current_time;
		cursor_move_time = 100;
	}
}
else if (!_block.moving)
{
	visible = false;
	if(keyboard_check_pressed(vk_up) && y > 3)
	{
		_block.y_dir = -1;
		_block.x_dir = 0;
		_block.move = true;
		_block._cursor = self;
		_push_indicator.visible = false;
	}
	if(keyboard_check_pressed(vk_down) && y < 75)
	{
		_block.y_dir = 1;
		_block.x_dir = 0;
		_block.move = true;
		_block._cursor = self;
		_push_indicator.visible = false;
	}
	if(keyboard_check_pressed(vk_left) && x > 3)
	{
		_block.y_dir = 0;
		_block.x_dir = -1;
		_block.move = true;
		_block._cursor = self;
		_push_indicator.visible = false;
	}
	if(keyboard_check_pressed(vk_right) &&  x < 42)
	{
		_block.y_dir = 0;
		_block.x_dir = 1;
		_block.move = true;
		_block._cursor = self;
		_push_indicator.visible = false;
	}
}

if(keyboard_check_pressed(vk_space) && place_meeting(x,y,obj_block) && !moving_block)
{
	_block = instance_nearest(x,y,obj_block);
	moving_block = true;
	
	_push_indicator.visible = true;
	_push_indicator.x = x;
	_push_indicator.y = y;
	nokia_play_sound(snd_select);
}

else if(keyboard_check_pressed(vk_space) && moving_block)
{
	moving_block = false;
	_push_indicator.visible = false;
	nokia_play_sound(snd_select);
}

else if(keyboard_check(vk_space) && place_meeting(x,y,obj_goal))
{
	penguin.alarm[0]= -1;
	penguin.movePenguino();
}