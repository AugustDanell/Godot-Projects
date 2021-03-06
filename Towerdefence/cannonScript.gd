extends Node2D
signal killedEnemy 

export var wait_time = 4
onready var area = $AttackArea
onready var ready_to_shoot = true
onready var gun_timer = $"Gun Timer"
onready var gun_sound = $"gunSound"
onready var particle_effect = $Particles2D
onready var build_effect = $BuildSmoke
onready var build_sound = $BuildSound
onready var ready_to_shoot_square = $ready_to_fire

func _attack(obj):
	if(ready_to_shoot):
		ready_to_shoot_square.modulate = Color(255, 0, 0, 40)
		look_at(obj.global_position)
		gun_timer.start(wait_time)		
		ready_to_shoot = false
		gun_sound.play()
		particle_effect.emitting = true
		obj.killed()
		emit_signal("killedEnemy")
		
func _ready():
	build_effect.emitting = true
	build_sound.play()
	ready_to_shoot_square.modulate = Color(0, 255, 0, 40)
	
func _physics_process(delta):
	if len(area.get_overlapping_bodies()) > 0:
		_attack(area.get_overlapping_bodies()[0])
	


func _on_Gun_Timer_timeout():
	ready_to_shoot = true
	ready_to_shoot_square.modulate = Color(0, 255, 0, 40)
