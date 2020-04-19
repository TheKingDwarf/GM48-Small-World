
if (update_pathing <= 0) {
	update_pathing = irandom_range(14/move_speed_max, 20/move_speed_max);
	target_inst = oPowerGenerator;

	if (distance_to_object(instance_nearest(x,y,pTurret)) < distance_to_object(target_inst) and !ignores_turrets) {
		target_inst = instance_nearest(x,y,pTurret);
	}

	target_direction = point_direction(x,y,target_inst.x, target_inst.y);

	var look_ahead_range = 24; //path around solid objects
	for (var i = 0; i < 4; i++) {
		var col = collision_line(x, y, x + lengthdir_x(look_ahead_range, target_direction), y + lengthdir_y(look_ahead_range, target_direction), pSolid, false, false);
		if (col == noone) {
		
			break;
		}
	
		target_direction =  point_direction(x,y,target_inst.x, target_inst.y) + power(-1, i) * i * 90;
	}
	
	if (distance_to_object(target_inst) > 160 and chance(40)) {
		target_direction += irandom_range(-35, 35);	
	}
	
	//if (xprevious == x and yprevious == y) {
	//	target_direction += choose(120, -120);	
	//}
	
} else {
	update_pathing--;	
}

if (x < 0) {
	target_direction = 0;
	update_pathing = 120;	
}
if (x > room_width) {
	target_direction = 180;
	update_pathing = 120;
}

if (y < 0) {
	target_direction = 270;
	update_pathing = 120;
}

if (distance_to_object(target_inst) > attack_range) {
	move_speed = approach(move_speed, move_speed_max, 0.4);
	move_direction = angle_lerp(move_direction, target_direction, 0.2);

	return false
}

return true;