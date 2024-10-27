extends Node2D


func _on_oxygen_manager_out_of_oxygen() -> void:
	get_tree().quit()
