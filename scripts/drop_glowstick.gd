extends Node2D

var glowstick_scene = preload("res://scenes/glowstick.tscn");


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


func _input(event):
	if event.is_action_pressed("drop_glowstick"):
		print("Pressed")
		var glowstick := glowstick_scene.instantiate()
		glowstick.get_child(0).position = position
		add_child(glowstick)
		
