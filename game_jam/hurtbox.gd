extends Area2D

@export var attack:int
@export var gets_destroyed: bool
@export var player_bullet: bool
func _on_area_entered(area):
	if !player_bullet:
		area.damage(attack)
	else:
		if area.is_in_group("enemy"):
			area.damage(attack)
