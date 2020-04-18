/// @description
if (alarm[1] > 4) {
	image_index = 1;
} else {
	image_index = 0;	
}

draw_sprite_ext(sprite_index, image_index, x, y, image_xscale * scale, image_yscale * scale, image_angle, image_blend, image_alpha);

if (turret_obj != noone) {
	draw_sprite_ext(object_get_sprite(turret_obj), 0, x + lengthdir_x(sprite_width, image_angle), y + lengthdir_y(sprite_width, image_angle), image_xscale * scale, image_yscale * scale, image_angle, image_blend, image_alpha);	
}