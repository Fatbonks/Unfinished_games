extends Area2D
@onready var timer = $Timer
@onready var animation = $AnimationPlayer
@export var is_death_animation_finish = false
var on_screen: bool = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !on_screen:
		global_position.x += 2
	if is_death_animation_finish == true:
		queue_free()
	


func _on_visible_on_screen_notifier_2d_screen_entered():
	on_screen = true
	animation.play("shoot")
	timer.start()

func _on_timer_timeout():
	animation.play("stop_bertyyer")
	

