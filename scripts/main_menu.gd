extends Control

func _on_play_pressed():
	get_tree().change_scene_to_file("res://scenes/game_scene.tscn")


func _on_exit_pressed():
	get_tree().quit()


func _on_help_pressed():
	get_tree().change_scene_to_file("res://scenes/how_to_play.tscn")
