/// @description
scale = 1;
flash = 0;
hp = 2;
damage = 1;
move_speed_max = 1;

ignores_turrets = false;

max_hp = hp;
flash = 0
move_speed = 0;

knockback = -1.2;
stun_timer = 0;

state = enemyStates.target;

enum enemyStates {
	target,
	stun,
	dead
}