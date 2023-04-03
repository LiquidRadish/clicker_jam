extends CharacterBody2D

var speed = 10.0
const MAX_SPEED = 100
var jumpVelocity = -300.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


'''
TODO:
	- Dial in movement, jump height
		- Current movement is sorta squishy (maybe we like it that way?)
		- Air movement is weird at high speeds

'''
func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Jump
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jumpVelocity

	# Right
	if Input.is_action_pressed("move_right"):
		velocity.x = min(MAX_SPEED, velocity.x + speed)
		
	# Left
	if Input.is_action_pressed("move_left"):
		velocity.x = max(-1 * MAX_SPEED, velocity.x - speed)
	
	# Reset horizontal velocity when no key pressed 
	if not Input.is_action_pressed("move_right") and not Input.is_action_pressed("move_left"):
		velocity.x = move_toward(velocity.x, 0, speed * 2)

	move_and_slide()
