extends Node2D

@export var unit_scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	for i in 10:
		var position = Utils.get_random_pos_in_sphere(200)
		spawn_unit(Vector2(0,0) + position, Vector2(300,500))

func spawn_unit(position: Vector2, goal: Vector2):
	var u = unit_scene.instantiate()
	$navigation/units.add_child(u)
	u.global_position = position
	u.set_target_position(goal)

func _process(_delta):
	pass
