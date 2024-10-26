extends Node

var glowstick_scene = preload("res://glowstick.tscn");

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


func _input(event):
	if event.is_action_pressed("drop_glowstick"):
		print("Pressed")
		var glowstick := glowstick_scene.instantiate()
		glowstick.get_child(0).position = Vector2(0,-100)
		add_child(glowstick)
		
