extends State

@export var idle_node: NodePath
@export var crouch_node: NodePath
@export var roll_node: NodePath

@onready var idle_state = get_node(idle_node)
@onready var crouch_state = get_node(crouch_node)
@onready var roll_state = get_node(roll_node)



func physics_process(delta: float) -> State:
	
	if Input.is_action_just_released('ui_down'):
		return idle_state
		
	if Input.is_action_just_pressed('ui_accept'):
		return roll_state
		
	var direction = Input.get_axis("ui_left", "ui_right")
		
	if direction:
		player.velocity.x = direction * (player.SPEED/2)
	else:
		return crouch_state
	
	return null
