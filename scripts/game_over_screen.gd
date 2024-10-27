extends Control

@export var game: PackedScene
@export var menu: PackedScene


func _on_retry_pressed() -> void:
	get_tree().change_scene_to_packed(game)


func _on_return_to_menu_pressed() -> void:
	get_tree().change_scene_to_packed(menu)
