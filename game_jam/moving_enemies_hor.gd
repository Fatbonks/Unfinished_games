extends CharacterBody2D

var is_death = false
var time:float
func _physics_process(delta):
	velocity.y = 75
	
	velocity.x += cos(time * 4) * 20
	if !is_death:
		move_and_slide()


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
