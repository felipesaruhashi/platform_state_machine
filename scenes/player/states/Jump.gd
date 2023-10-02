extends State
#Jump
@export var idle_node: NodePath
@export var running_node: NodePath
@export var falling_node: NodePath
@export var attack_node: NodePath

@onready var falling_state = get_node(falling_node)
@onready var idle_state = get_node(idle_node)
@onready var attack_state = get_node(attack_node)

const JUMP_VELOCITY = -400.0

func enter() -> void:
	super()
	if player.is_on_floor():
		player.velocity.y = JUMP_VELOCITY
	
func physics_process(delta: float) -> State:
	
	if Input.is_action_just_pressed("attack"):
		return attack_state
	
	var direction = Input.get_axis("ui_left", "ui_right")
	
	if direction:
		player.velocity.x = direction * player.SPEED
	else:
		player.velocity.x = 0
	if player.velocity.y > 0:
		return falling_state

	return null
