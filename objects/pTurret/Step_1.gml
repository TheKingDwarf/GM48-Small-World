/// @description
if (hp < 0) {
	
	instance_destroy();	
}

offset = irandom_range(-4,4)

if hp <= 3 {
	if (active) {
		instance_create_layer(x+offset,y+offset,"Top",oSmoke)
	} else {
		if (chance(35)) {
			instance_create_layer(x+offset,y+offset,"Top",oSmoke);
		}
	}
}

if (active) {
	image_blend = c_white;	
} else {
	image_blend = c_gray;
}