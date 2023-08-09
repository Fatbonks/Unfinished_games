extends Node2D

@onready var death_explodion = preload("res://death_particles.tscn")
@onready var audio = $AudioStreamPlayer2D
@export var main_object: CharacterBody2D
@export var health:int
@onready var timer = $Timer
@export var sprite: Node2D
@export var hitbox: Area2D
var dead = false
func _damage(attack):
	if dead == false:
		health -= attack
		if health <= 0:
			if hitbox.is_in_group("enemy"):
				Global.current_amount_enemy -= 1
			audio.play()
			sprite.visible = false
			main_object.is_death = true
			var explode = death_explodion.instantiate()
			owner.add_child(explode)
			explode.global_position = global_position
			timer.start(1)
			dead = true
			


func _on_timer_timeout():
	if is_in_group("player"):
		get_tree().reload_current_scene()
	else:
		owner.queue_free()
