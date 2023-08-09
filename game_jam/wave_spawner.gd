extends Node2D
@onready var button = $Button
@onready var text = $TextEdit
@onready var spawn_point_vertical = $Path2D/PathFollow2D
@onready var spawn_point_horizontal = $Path2D2/PathFollow2D
@onready var timer = $Timer
@export var enemy_list = {}
@export var currwave:int
var wave_value:int
var can_spawn:bool = true
@export var enemy_to_spawn = []
var enemy_spawn_type = []
var amount_of_enemies:int
var can_generate:bool = false
func _ready():
	generate_wave()
	
func _process(delta):
	if can_spawn:
		if len(enemy_to_spawn) > 0:
			randomize()
			if enemy_spawn_type[0] == 1:
				var inst_enemy = enemy_to_spawn[0].instantiate()
				spawn_point_horizontal.progress_ratio = randf_range(0, 1)
				add_child(inst_enemy)
				inst_enemy.global_position = spawn_point_horizontal.global_position
				enemy_spawn_type.remove_at(0)
				enemy_to_spawn.remove_at(0)
			elif enemy_spawn_type[0] == 2:
				var inst_enemy = enemy_to_spawn[0].instantiate()
				spawn_point_vertical.progress_ratio = randf_range(0, 1)
				add_child(inst_enemy)
				inst_enemy.global_position = spawn_point_vertical.global_position
				enemy_spawn_type.remove_at(0)
				enemy_to_spawn.remove_at(0)
			can_spawn = false
			timer.start(0.3)
	if Global.current_amount_enemy <= 0 and can_generate:
		currwave += 1
		can_generate = false
		generate_wave()  
func generate_wave():
	wave_value = currwave * 10
	generate_enemies()

func generate_enemies():
	randomize()
	var generated_enemies = []
	while wave_value > 0:
		var rand_enemy = randi_range(0, len(enemy_list) - 1)
		var rand_enemy_cost = enemy_list.values()[rand_enemy].values()[0]
		if wave_value - rand_enemy_cost >= 0:
			generated_enemies.append(enemy_list.keys()[rand_enemy])
			enemy_spawn_type.append(enemy_list.values()[rand_enemy].values()[1])
			wave_value -= rand_enemy_cost
		elif wave_value <= 0:
			break
	enemy_to_spawn.clear()
	enemy_to_spawn = generated_enemies
	Global.current_amount_enemy = len(enemy_to_spawn)
	can_generate = true


func _on_timer_timeout():
	can_spawn = true
