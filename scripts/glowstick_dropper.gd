extends Node2D

var glowstick_scene = preload("res://glowstick.tscn");
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _drop_glowstick():
	var glowstick := glowstick_scene.instantiate()
	glowstick.get_child(0).position = position
	add_child(glowstick)
