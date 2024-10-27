class_name GlowstickManager
extends Node2D

var num_of_glowsticks = 10;

const glowstick_scene = preload("res://scenes/glowstick.tscn");

signal drop_glowstick;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _input(event):
	if event.is_action_pressed("drop_glowstick") and num_of_glowsticks > 0:
		var glowstick := glowstick_scene.instantiate()
		glowstick.get_child(0).position = get_parent().get_node("Player").position
		glowstick.retrieve_glowstick.connect(_on_retrieve_glowstick)
		add_child(glowstick)
		num_of_glowsticks -= 1
		
func _on_retrieve_glowstick(glowstick : Node2D):
	num_of_glowsticks += 1
	remove_child(glowstick)
