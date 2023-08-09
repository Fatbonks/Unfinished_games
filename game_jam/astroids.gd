extends RigidBody2D

@onready var timer = $Timer


func _on_visible_on_screen_notifier_2d_screen_exited():
	timer.start()


func _on_timer_timeout():
	print("done")
	queue_free()
	
