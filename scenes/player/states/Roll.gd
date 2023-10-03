extends State

@export var crouch_node: NodePath

@onready var crouch_state = get_node(crouch_node)


func physics_process(delta: float) -> State:
	
	if not player.animations.is_playing():
		return crouch_state
	
	var direction = Input.get_axis("ui_left", "ui_right")
	
	player.velocity.y = 200
	
	if direction:
		player.velocity.x = direction * player.SPEED
		
	return null

