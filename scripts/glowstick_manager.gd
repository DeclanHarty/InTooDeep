class_name GlowstickManager
extends Node2D

var num_of_glowsticks = 10;

const glowstick_scene = preload("res://scenes/glowstick.tscn");

signal glowstick_num_change(num_of_glowsticks : int);

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _input(event):
	if event.is_action_pressed("drop_glowstick") and num_of_glowsticks > 0:
		var glowstick := glowstick_scene.instantiate()
		glowstick.position = get_parent().get_node("Player").position
		glowstick.retrieve_glowstick.connect(_on_retrieve_glowstick)
		add_child(glowstick)
		num_of_glowsticks -= 1
		glowstick_num_change.emit(num_of_glowsticks)
		
func _on_retrieve_glowstick(glowstick : Node2D):
	num_of_glowsticks += 1
	glowstick_num_change.emit(num_of_glowsticks)
