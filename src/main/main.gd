extends Node2D

@export var unit_scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	$unit.speed = 0
	$unit.target = $unit

	for i in 3:
		var position = Utils.get_random_pos_in_sphere(500)
		spawn_unit(Vector2(200,200) + position, $unit)

func spawn_unit(position: Vector2, target):
	var u = unit_scene.instantiate()
	$navigation/units.add_child(u)
	u.global_position = position
	u.set_target_position(target.global_position)
	u.target = target

func _process(_delta):
	pass
