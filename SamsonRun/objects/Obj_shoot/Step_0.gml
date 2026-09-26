 var next_x = x + move_speed * direction_x;
 
 if(place_meeting(next_x,y, obj_block))
 {
	instance_destroy();
 }
 else
 {
	x = next_x;
 }