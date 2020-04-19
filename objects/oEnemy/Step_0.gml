/// @description
event_inherited();

switch state {
	case enemyStates.target		:		
	var ready_to_attack = false;

	ready_to_attack = enemy_target();	
	
	move(move_speed, move_direction);
	
	if (ready_to_attack) {
		if (sprite_index != sEnemyA) {
			image_xscale = sign(target_inst.x - x)
			image_speed = 1;
			image_index = 0;
			sprite_index = sEnemyA;
		}
		
		if (floor(image_index) == 7) {
			target_inst.hp--;
			oCamera.screenshake = 0.2;
			//sleep(50);
			image_index = 8;
		}
		
	} else {
		image_speed = 1;	
	}
		
	break;
	case enemyStates.stun		:		 
	stun_timer--;
	
	if (stun_timer <= 0) state = enemyStates.target;
	break;
	case enemyStates.dead		:	
	
	sprite_index = sEnemyD
	//image_angle = angle_lerp(image_angle, -90, 0.3);
	image_blend = c_gray;
	image_alpha = dead_timer/40;
	dead_timer--;
	
	death_speed = approach(death_speed, 0, 0.35);
	move(death_speed, move_direction);
	
	if (floor(death_speed) != round(death_speed)) {
		for (var i = death_speed; i > 0 and death_speed > 2.5; i-=4.0) {
			instance_create_layer(x,y,"instances",oParticleGround)
			//part_particles_create(global.part_system_below, x + choose(-1, 1) * i, y + 4, global.dust_up_particle, 1);	
		}
	}
	
	if (xprevious == x and yprevious == y) {
		//move_direction = move_direction + 180;
		
		//switch floor(move_direction/90) {
		//	case 0:	case 1: move_direction = 180 - move_direction; break;
		//	case 2: move_direction = 180 + 180 - move_direction;
		//	case 3: move_direction = 180 + 90 - move_direction;
			
		//}
		move_direction = -1 * move_direction;
	
		death_speed = death_speed;
	}
	
	if (dead_timer == 0) instance_destroy(id, false);
	break;
}

if (x > xprevious) {
	image_xscale = 1;
} else if (x < xprevious) {
	image_xscale = -1;	
}