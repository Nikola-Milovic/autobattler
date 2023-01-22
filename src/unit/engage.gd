# Engage
extends State

@onready var walk = %walk

func update(delta):
	walk.go_towards_target(delta)
	
	#TODO figure out how to navigate around units that are stationary
	# 1) submit a bug report to godot since they should go around
	# 2) apply forces to push the unit away, based on distance to our target
	# 3) choose a different spot, instead of going towards our target, we can 
	# go towards a spot on the ground in our attack range
	
	if unit.is_distance_to_unit(unit.target, unit.attack_range):
		unit.state.transition_to("attack")

