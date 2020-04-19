/// @description
if (target != noone) {
	voltage = approach(voltage, 0, voltage_base_decrease_per_step/capacitors);	
}

voltage = clamp(voltage, 0, hp * 1000);

if (voltage > (hp-1.8) * 1000) {
	too_easy += 0.001;	

	too_easy = clamp(too_easy, 0, 1);
} else {
	too_easy = 0;	
}

scale = lerp(scale, 1.0, 0.5);

if (!instance_exists(target) or voltage == 0) {
	target = noone;	
}

if (place_meeting(x,y,oPlayerHitbox) and voltage > 0) {
	target = oDoor;
	scale = 0.8;
	oCamera.screenshake += 0.04;
	with (oPlayerHitbox) {
		audio_sound_gain(hit_sound, 1, 0);
		audio_sound_gain(miss_sound, 0, 0);	
	}
}

offset = random_range(-6,6)

if hp <= 5
instance_create_layer(x+offset,y+offset,"Top",oSmoke)

if (hp < 0) {
	room_restart();
	part_system_clear(global.part_system_permanent);
}

