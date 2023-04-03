extends CharacterBody2D


const SPEED = 10.0
const JUMP_VELOCITY = -10.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Jump
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Right
	if Input.is_action_pressed("move_right"):
		velocity.x += SPEED
		
	# Left
	if Input.is_action_pressed("move_left"):
		velocity.x -= SPEED
	
	# Reset horizontal velocity when no key pressed 
	if not Input.is_action_pressed("move_right") and not Input.is_action_pressed("move_left"):
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
