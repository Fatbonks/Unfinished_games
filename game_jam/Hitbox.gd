extends Area2D

@export var health: Node2D


func damage(attack):
	print("works")
	health._damage(attack)
