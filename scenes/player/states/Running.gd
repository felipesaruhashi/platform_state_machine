extends State
#Running
@export var idle_node: NodePath
@export var jump_node: NodePath
@export var falling_node: NodePath

@onready var idle_state = get_node(idle_node)
@onready var jump_state = get_node(jump_node)


func physics_process(delta: float) -> State:
	var direction = Input.get_axis("ui_left", "ui_right")
	
	if Input.is_action_just_pressed('ui_accept'):
		return jump_state
	if direction:
		player.velocity.x = direction * player.SPEED
		
		return null
	else:
		return idle_state
