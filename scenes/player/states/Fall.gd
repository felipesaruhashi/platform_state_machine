extends State

@export var idle_node: NodePath
@export var jump_node: NodePath
@export var running_node: NodePath

@onready var idle_state = get_node(idle_node)

func physics_process(delta: float) -> State:
	if player.is_on_floor():
		return idle_state
		
	var direction = Input.get_axis("ui_left", "ui_right")
	
	if direction:
		player.velocity.x = direction * player.SPEED
	else:
		player.velocity.x = 0

	return null
