extends CharacterBody2D


const SPEED = 300.0
const ACCELERATION = 250.0
const FRICTION = 200.0

signal direction_changed(new_direction)


func _physics_process(delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input := Vector2(Input.get_axis("ui_left", "ui_right"), Input.get_axis("ui_up", "ui_down"))
	if sign(input.x) != sign(velocity.x) and input.x:
		velocity.x = move_toward(velocity.x, sign(input.x) * SPEED, ACCELERATION * delta)
		velocity.x = move_toward(velocity.x, 0, FRICTION * delta)
		#print("Friction + Acceleration")
	elif input.x:
		velocity.x = move_toward(velocity.x, sign(input.x) * SPEED, ACCELERATION * delta)
	else: 
		velocity.x = move_toward(velocity.x, 0, FRICTION * delta)
		#print("Friction")
		
	if sign(input.y) != sign(velocity.y):
		velocity.y = move_toward(velocity.y, sign(input.y) * SPEED, ACCELERATION * delta)
		velocity.y = move_toward(velocity.y, 0, FRICTION * delta)
	elif input.y:
		velocity.y = move_toward(velocity.y, sign(input.y) * SPEED, ACCELERATION * delta)
	else: 
		velocity.y = move_toward(velocity.y, 0, FRICTION * delta)
	
	if(velocity):
		direction_changed.emit(velocity)


	move_and_slide()
