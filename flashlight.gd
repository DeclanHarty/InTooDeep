extends PointLight2D

var current_direction : int = 1
const LIGHT_DISTANCE_FROM_PLAYER : float = 244.0
const LIGHT_ROTATION_SPEED : float = 1
var target_light_position : Vector2 = Vector2(0,0)
var rotation_target : float


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	rotation = atan(position.y/position.x)


func _on_character_body_2d_direction_changed(velocity: Vector2) -> void:
	if(sign(velocity.x) != 0 and sign(velocity.x) != current_direction):
		#position.x = -position.x
		scale.x = -scale.x
		current_direction = sign(velocity.x)
		
	if(velocity):
		position = velocity.normalized() * LIGHT_DISTANCE_FROM_PLAYER
