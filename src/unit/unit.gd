extends CharacterBody2D
class_name Unit

@onready var agent = $agent
var speed = 100
var current_target_position 

@onready var state: StateMachine = $state_machine

func _ready():
	agent.target_reached.connect(_on_target_reached)
	pass
	
func _process(delta):
	pass
	
func set_target_position(target_position) -> void: 
	current_target_position = target_position
	agent.target_location = target_position

func _draw():
	#TODO add if debug check
	draw_path()

func draw_path():
	print(agent.get_current_navigation_path())
	var prev_p = global_transform.origin
	for p in agent.get_current_navigation_path():
		draw_line(prev_p, p, Color.CORAL, 2.0)

func _on_target_reached():
	print("Target reached: ", global_position)
	state.transition_to("idle")
