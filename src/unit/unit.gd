extends CharacterBody2D
class_name Unit

@onready var agent: NavigationAgent2D = $agent
@onready var state: StateMachine = $state_machine

var team = 0

var speed = 100
var engage_distance = 200
var attack_range = 60

var target
var movement_target

func _ready():
	agent.target_reached.connect(_on_target_reached)
	state.transitioned.connect(_on_state_changed)
	
func _process(delta):
	if Settings.is_debug:
		queue_redraw()

func set_target_position(target_position) -> void: 
	agent.target_location = target_position

func _draw():
	if Settings.is_debug:
		#draw_path()
		draw_state()

func draw_path():
	var prev_p = global_transform.origin
	for p in agent.get_current_navigation_path():
		if p == prev_p:
			continue
		draw_line(prev_p, p, Color.CORAL, 2.0)
		prev_p = p

func draw_state():
	var default_font = ThemeDB.fallback_font
	var default_font_size = ThemeDB.fallback_font_size
	draw_string(default_font, Vector2(-10, 30), state.state.name, HORIZONTAL_ALIGNMENT_LEFT, -1, default_font_size-4)

func _on_state_changed(state):
	print("changed state ", state)

func _on_target_reached():
	print("Target reached: ", global_position)
	state.transition_to("idle")

func is_distance_to_unit(unit: Unit, distance: float) -> bool:
	if unit.global_position.distance_to(global_position) < distance:
		return true
	return false
