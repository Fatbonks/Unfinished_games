extends Camera2D



var shake_amount = 0

var default_offset = offset

@onready var tween = create_tween()

@onready var timer = $Timer



func _ready():
	Global.connect("shake_cam", shake)
	set_process(false)

	randomize()



func _process(delta):

	offset = Vector2(randf_range(-1, 1) * shake_amount, randf_range(-1, 1) * shake_amount)



func shake(time, amount):

	timer.wait_time = time

	shake_amount = amount

	set_process(true)

	timer.start()


func _on_timer_timeout():
	set_process(false)
	tween.tween_property(self, "offset", offset, default_offset)
	tween.start()
