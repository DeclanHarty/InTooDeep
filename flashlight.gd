extends PointLight2D

var current_direction : int = 1


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_character_body_2d_direction_changed(new_direction: Variant) -> void:
	if(sign(new_direction.x) != current_direction):
		position.x = -position.x
		texture
		current_direction = sign(new_direction.x)
