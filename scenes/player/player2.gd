class_name Player
extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@onready var stateManager: StateManager = $StateManager
@onready var animations = $AnimationPlayer
@onready var sprite = $Sprite2D

#Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready() -> void:
	stateManager.init(self)
	
func _physics_process(delta) -> void:
	if not is_on_floor():
		velocity.y += gravity * delta

	stateManager.physics_process(delta)
	
	move_and_slide()
	
func _unhandled_input(event) -> void:
	var direction = Input.get_axis("ui_left", "ui_right")

	print(direction)
	if direction > 0:
		sprite.scale.x = 1
	elif direction < 0:
		sprite.scale.x = -1
		
	stateManager.input(event)

func _process(delta) -> void:
	stateManager.process(delta)


#@onready var anim = $AnimationPlayer

#var playing_attack_1 = false

# Get the gravity from the project settings to be synced with RigidBody nodes.
#var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

#func _physics_process(delta):
#	# Add the gravity.
#	if not is_on_floor():
#		velocity.y += gravity * delta
#
#	# Handle Jump.
#	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
#		velocity.y = JUMP_VELOCITY
#
#	# Get the input direction and handle the movement/deceleration.
#	# As good practice, you should replace UI actions with custom gameplay actions.
#	var direction = Input.get_axis("ui_left", "ui_right")
#	if direction:	
#		velocity.x = direction * SPEED
#
#		anim.play("run")
#
#		if direction > 0:
#			$Sprite2D.scale.x = 1
#		else:
#			$Sprite2D.scale.x = -1
#	else:
#		anim.play("idle")
#		velocity.x = move_toward(velocity.x, 0, SPEED)
#
#	move_and_slide()
#
#func is_playing_attack():
#	return playing_attack_1
