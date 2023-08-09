extends CharacterBody2D


const SPEED = 10
const JUMP_VELOCITY = -30

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var is_death = false
@export var poly: Polygon2D
@export var polycol: CollisionPolygon2D
func _physics_process(delta):
	# Add the gravity.
	#if not is_on_floor():
		#velocity.y += gravity * delta
	# Handle Jump.
	#if Input.is_action_pressed("ui_up"):
		#velocity.y = JUMP_VELOCITY
		#if velocity.y < -150:
			#velocity.y = -150

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction_x = Input.get_axis("ui_left", "ui_right")
	var direction_y = Input.get_axis("ui_up", "ui_down")
	velocity.x = clamp(velocity.x, -300, 300)
	velocity.y = clamp(velocity.y, -300, 300)
	if direction_x:
		velocity.x += direction_x * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, 20)
		
	if direction_y:
		velocity.y += direction_y * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, 20)
	if !is_death:
		move_and_slide()
	if direction_x == -1:
		global_rotation = lerp_angle(global_rotation, -0.3, 0.1)
	elif direction_x == 1:
		global_rotation = lerp_angle(global_rotation, 0.3, 0.1)
	else:
		global_rotation = lerp_angle(global_rotation, 0, 0.5)

