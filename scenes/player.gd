extends CharacterBody2D

@onready var anim = $AnimatedSprite2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var playing_attack_1 = false

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		if not is_playing_attack():
			if velocity.y > 0:
				anim.play("jump")
			else:
				anim.play("fall")

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		
		anim.flip_h = direction < 0
		
		if is_on_floor() and not is_playing_attack():
			anim.play('run')
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if is_on_floor() and not is_playing_attack():
			anim.play('idle')
	
	if Input.is_action_pressed("attack"):
		anim.play("attack1")
		playing_attack_1 = true
	
	move_and_slide()

func is_playing_attack():
	return playing_attack_1

func _on_animated_sprite_2d_animation_finished():
	if anim.animation == 'attack1':
		playing_attack_1 = false
