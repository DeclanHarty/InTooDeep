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
		glowstick.connect("pickup_glowstick", func(): num_of_glowsticks += 1)
		glowstick.position = %Player.position
		add_child(glowstick)
		num_of_glowsticks -= 1
