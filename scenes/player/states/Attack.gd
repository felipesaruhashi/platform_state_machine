extends State
#Attack
func physics_process(delta: float) -> State:
	if not player.animations.is_playing():
		return stateManager.previous_state
	return null

func enter() -> void:
	super()
	player.velocity.x = 0
