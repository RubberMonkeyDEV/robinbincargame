extends CharacterBody2D

# Constants
const ACCELERATION = 200.0
const MAX_SPEED = 300.0
const FRICTION = 150.0
@export var turn_speed = 5.0
@export var speed = 100

# Variables


func _process(delta: float) -> void:
	velocity = Vector2.ZERO
	# Handle input
	var input_vector = Vector2.ZERO

	if Input.is_action_pressed("move_up"):
		input_vector.y += speed
	if Input.is_action_pressed("move_down"):
		input_vector.y -= speed
	if Input.is_action_pressed("move_left"):
		rotation -= turn_speed * delta
	if Input.is_action_pressed("move_right"):
		rotation += turn_speed * delta


	# Apply acceleration
	if input_vector.y != 0:
		velocity += Vector2(ACCELERATION * input_vector.y * delta, 0).rotated(rotation)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)

	# Clamp the speed
	if velocity.length() > MAX_SPEED:
		velocity = velocity.normalized() * MAX_SPEED
	move_and_slide()

	

