extends State

@export var idle_node: NodePath
@export var running_node: NodePath
@export var falling_node: NodePath

@onready var falling_state = get_node(falling_node)
@onready var idle_state = get_node(idle_node)

const JUMP_VELOCITY = -400.0

func enter() -> void:
	super()
	player.velocity.y = JUMP_VELOCITY
	
func physics_process(delta: float) -> State:
	
	var direction = Input.get_axis("ui_left", "ui_right")
	
	if direction:
		player.velocity.x = direction * player.SPEED
	else:
		player.velocity.x = 0
	if player.velocity.y > 0:
		return falling_state

	return null
