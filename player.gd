extends CharacterBody2D

var speed = 10.0
const MAX_SPEED = 100
var jumpVelocity = -300.0

const START_POS = Vector2(240, 450)

signal hit

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

'''
TTODO:
	- Dial in movement, jump height
		- Current movement is sorta squishy (maybe we like it that way?)
		- Air movement is weird at high speeds
		
	- Collision with sawblade is weird

'''

# can be used to reset or change location 
func start(pos):
	position = pos
	velocity.x = 0
	velocity.y = 0
	show()
	

# Called every frame
func _process(delta: float) -> void:
	update_animation()
	
	
# Updates the character to have the correct sprite based on direction and input
func update_animation():
	# Face the correct direction
	if velocity.x > 0:
		$AnimatedSprite2D.flip_h = false
	elif velocity.x < 0:
		$AnimatedSprite2D.flip_h = true
	
	if is_on_floor() and velocity.x == 0:
		$AnimatedSprite2D.play("idle_right")
	elif is_on_floor():
		$AnimatedSprite2D.play("walk_right")
	else:
		$AnimatedSprite2D.play("jump_right")


# Handles movement input and changes in velocity
func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Jump
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jumpVelocity - GlobalVariables.jump_speed

	# Right
	if Input.is_action_pressed("move_right"):
		velocity.x = min(MAX_SPEED + GlobalVariables.move_speed, velocity.x + speed)
		
	# Left
	if Input.is_action_pressed("move_left"):
		velocity.x = max(-1 * MAX_SPEED - GlobalVariables.move_speed, velocity.x - speed)
	
	# Reset horizontal velocity when no key pressed 
	if not Input.is_action_pressed("move_right") and not Input.is_action_pressed("move_left"):
		velocity.x = move_toward(velocity.x, 0, speed * 2)

	# Actually update position
	move_and_slide()
	
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		# TODO : there has to be a better way to detect collision with specific object...
		if collision.get_collider().to_string().to_lower().contains('sawblade'):
			start(START_POS)


