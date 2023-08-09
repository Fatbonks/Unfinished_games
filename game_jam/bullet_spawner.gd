extends Node2D

@onready var bullet = preload("res://bullet_types/bullet.tscn")
@onready var audio = $AudioStreamPlayer2D
@onready var firerate = $Timer
var can_shoot = true
func _process(delta):
	if can_shoot:
		audio.play()
		Global.emit_signal("shake_cam", 0.3, 0.4)
		var inst_bullet = bullet.instantiate()
		owner.add_child(inst_bullet)
		var new_owner = inst_bullet.get_parent()
		new_owner.remove_child(inst_bullet)
		new_owner.owner.add_child(inst_bullet)
		inst_bullet.get_child(3).player_bullet = true
		inst_bullet.global_position = global_position + Vector2(0, -5) 
		can_shoot = false
		firerate.start(0.5)


func _on_timer_timeout():
	can_shoot = true
