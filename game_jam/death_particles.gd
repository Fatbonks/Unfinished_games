extends Node2D

@onready var particles_1 = $GPUParticles2D
@onready var particles_2 = $GPUParticles2D2


func _ready():
	particles_1.emitting = true
	particles_2.emitting = true

