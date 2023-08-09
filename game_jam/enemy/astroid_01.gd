extends CharacterBody2D
@onready var hit = $Hitbox
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var is_death = false
func _process(delta):
	var degrees_per_second = 50.0
	rotate(delta * deg_to_rad(degrees_per_second))
	

func _physics_process(delta):
	if not is_on_floor():
		velocity.y = 75 
	if !is_death:
		move_and_slide()




func _on_visible_on_screen_notifier_2d_screen_entered():
	hit.monitorable = true
