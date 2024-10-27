extends PointLight2D

var current_direction : int = 1
const LIGHT_DISTANCE_FROM_PLAYER : float = 244.0
const LIGHT_ROTATION_SPEED : float = 10
var target_light_position : Vector2 = Vector2(0,0)
var rotation_target : float


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var mouse_position = get_viewport().get_mouse_position()
	var screen_size = get_viewport().size
	var screen_center = Vector2(screen_size.x / 2, screen_size.y/2)
	var difference = mouse_position - screen_center
	var added_rads = (PI if difference.x < 0 else 0.0)
	rotation = atan(difference.y/difference.x) + added_rads
	print(rotation)
	position = Vector2(LIGHT_DISTANCE_FROM_PLAYER * cos(rotation), LIGHT_DISTANCE_FROM_PLAYER * sin(rotation))
	print(position)
	#rotation = rotate_toward(rotation, atan(position.y/position.x) + added_rads, LIGHT_ROTATION_SPEED * delta)
	


#func _on_character_body_2d_direction_changed(velocity: Vector2) -> void:
	##if(sign(velocity.x) != 0 and sign(velocity.x) != current_direction):
		##position.x = -position.x
		##scale.x = -scale.x
		##current_direction = sign(velocity.x)
		#
	#if(velocity):
		#position = velocity.normalized() * LIGHT_DISTANCE_FROM_PLAYER
