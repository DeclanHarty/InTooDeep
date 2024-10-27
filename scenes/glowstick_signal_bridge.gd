extends Node2D

signal retrieve_glowstick(glowstick : Node2D)

func _on_interaction_range_retrive_glowstick() -> void:
	retrieve_glowstick.emit(self)
