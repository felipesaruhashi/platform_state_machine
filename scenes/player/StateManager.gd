class_name StateManager
extends Node

@export var starting_state: NodePath

var current_state: State
var previous_state: State

func change_state(new_state: State) -> void:
	
	print(new_state.animation_name)
	if current_state:
		previous_state = current_state
		current_state.exit()

	current_state = new_state
	current_state.enter()

# Initialize the state machine by giving each state a reference to the objects
# owned by the parent that they should be able to take control of
# and set a default state
func init(player: Player) -> void:
	for child in get_children():
		child.player = player
		child.stateManager = self

	# Initialize with a default state of idle
	change_state(get_node(starting_state))
	
# Pass through functions for the Player to call,
# handling state changes as needed
func physics_process(delta: float) -> void:
	var new_state = current_state.physics_process(delta)
	if new_state:
		change_state(new_state)

func input(event: InputEvent) -> void:
	var new_state = current_state.input(event)
	if new_state:
		change_state(new_state)

func process(delta: float) -> void:
	var new_state = current_state.process(delta)
	if new_state:
		change_state(new_state) 
