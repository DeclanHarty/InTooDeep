extends Control

@export var menu: PackedScene

func _on_back_pressed():
	get_tree().change_scene_to_packed(menu)
