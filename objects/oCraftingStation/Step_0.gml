/// @description

// Inherit the parent event
event_inherited();

if (alarm[0] > 0 and active) {
	active = false;
	oPowerGenerator.target = noone;	
	
}

if (alarm[0] > 0) {
	scale = lerp(scale, 0.85, 0.02);	
} else {
	scale = lerp(scale, 1.0, 0.2);		
}

if (active) {
	oPowerGenerator.voltage_base_decrease_per_step = 16;
	
	image_speed = 1;
	
	var price = max(1.0, instance_number(pTurret)/2) * 1000;
	
	if (oPowerGenerator.voltage > price and alarm[0] <= 0) {
		image_blend = c_white;
	} else {
		image_blend = c_gray;	
	}
	
	if (place_meeting(x,y,oPlayerHitbox) and oPowerGenerator.voltage > price and alarm[0] <= 0) {
		oPowerGenerator.target = id;	
		oPowerGenerator.scale = 0.8;	
		oPowerGenerator.voltage -= price;	
		oPowerGenerator.target = noone;	
		scale = 0.8;
		
		lever_index = 1;
		
		image_speed = 0;
		alarm[0] = 40;
		// play lottery sound effect
		
		oWrench.turret_obj = choose(oTurret, oLaserTurret, oDoubleTurret, oDoubleLaserTurret);
	} 
	
	if !(oPowerGenerator.voltage > price and alarm[0] <= 0) {
		active = false;
		oPowerGenerator.target = noone;	
	}
	
	
	
} else {
	
	var price = max(1.0, instance_number(pTurret)/2) * 1000;
	if (oPowerGenerator.voltage > price and alarm[0] <= 0) {
		image_blend = c_white;
	} else {
		image_blend = c_gray;	
	}
}


