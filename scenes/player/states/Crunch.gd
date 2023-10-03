extends State
#Crunch

@export var idle_node: NodePath
@export var crouch_walking_node: NodePath
@export var crouch_attack_node: NodePath

@onready var idle_state = get_node(idle_node)
@onready var crouch_walking_state = get_node(crouch_walking_node)
@onready var crouch_attack_state = get_node(crouch_attack_node)

func enter() -> void:
	super()
	player.velocity.x = 0

func physics_process(delta: float) -> State:
	
	if Input.is_action_pressed('attack'):
		return crouch_attack_state
	
	if not Input.is_action_pressed('ui_down'):
		return idle_state
	
	if Input.is_action_pressed('ui_down') and (Input.is_action_pressed('ui_left') or Input.is_action_pressed('ui_right')):
		return crouch_walking_state
	return null
