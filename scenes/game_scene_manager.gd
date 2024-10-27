extends Node2D

var game_over_screen = preload("res://scenes/game_over_screen.tscn")
var win_screen = preload("res://scenes/game_over_screen.tscn")

func _on_oxygen_manager_out_of_oxygen() -> void:
	get_tree().change_scene_to_packed(game_over_screen)


func _on_area_2d_body_entered(body: Node2D) -> void:
	get_tree().change_scene_to_packed(win_screen)
