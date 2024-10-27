extends Control

@export var game: PackedScene
@export var how_to_play: PackedScene

func _on_play_pressed():
	get_tree().change_scene_to_packed(game)


func _on_exit_pressed():
	get_tree().quit()


func _on_help_pressed():
	get_tree().change_scene_to_packed(how_to_play)
