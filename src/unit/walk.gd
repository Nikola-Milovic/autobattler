# Walk
extends State

func go_towards_target(delta: float):
	if !unit.agent.is_target_reachable():
		unit.state.transition_to("idle")
		return
	
	var agent = unit.agent
	var next_location = agent.get_next_location()
	#print("next location: ", next_location)
	var direction = (unit.agent.get_next_location() - unit.global_transform.origin).normalized()
	unit.velocity = unit.velocity.move_toward(direction * unit.speed, 540 * delta)
	agent.set_velocity(unit.velocity)
	
	if !agent.avoidance_enabled:
		unit.move_and_slide()

func update(delta: float) -> void:
	go_towards_target(delta)
	
	if unit.is_distance_to_unit(unit.target, unit.engage_distance):
		unit.state.transition_to("engage")
		
func _on_agent_velocity_computed(safe_velocity):
	unit.velocity = safe_velocity
	unit.move_and_slide()
