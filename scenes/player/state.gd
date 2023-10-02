class_name State
extends Node

@export var animation_name: String

# Pass in a reference to the player's kinematic body so that it can be used by the state
var player: Player
var stateManager: StateManager

func enter() -> void:
	player.animations.play(animation_name)

func exit() -> void:
	pass

func input(event: InputEvent) -> State:
	return null

func process(delta: float) -> State:
	return null

func physics_process(delta: float) -> State:
	return null
