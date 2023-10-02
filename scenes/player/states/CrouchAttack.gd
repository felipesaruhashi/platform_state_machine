extends State

@export var idle_node: NodePath

@onready var idle_state = get_node(idle_node)


func physics_process(delta: float) -> State:
	if not player.animations.is_playing():
		return stateManager.previous_state
		
	if not Input.is_action_pressed("ui_down"):
		return idle_state
	return null
