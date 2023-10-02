extends State
#Fall
@export var idle_node: NodePath
@export var jump_node: NodePath
@export var running_node: NodePath

@onready var idle_state = get_node(idle_node)
@onready var jump_state = get_node(jump_node)
@onready var running_state = get_node(running_node)

func physics_process(delta: float) -> State:
	if Input.is_action_just_pressed('ui_accept') and player.is_on_floor():
		return jump_state
		
	var direction = Input.get_axis("ui_left", "ui_right")
	
	if direction:
		player.velocity.x = direction * player.SPEED
		
		if player.is_on_floor():
			return running_state
	else:
		player.velocity.x = 0
		if player.is_on_floor():
			return idle_state

	return null
