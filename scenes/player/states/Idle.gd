extends State

func enter(_msg := {}) -> void:
	owner.velocity = Vector2.ZERO
	
# Virtual function. Corresponds to the `_process()` callback.
func update(_delta: float) -> void:
	pass
