extends Node2D

@onready var time_before_despawn = $time_before_despawn
@export var time:int
@export var speed:int


func _ready():
	time_before_despawn.start(time)
	
func _physics_process(delta):
	var dir = Vector2.RIGHT.rotated(rotation)
	global_position.y += -500 * delta


func _on_time_before_despawn_timeout():
	queue_free()
