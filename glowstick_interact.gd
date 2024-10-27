extends Area2D

signal retrive_glowstick

var player_is_in

func _process(delta: float) -> void:
	if(Input.is_action_pressed("retrieve_glowstick") and player_is_in):
		retrive_glowstick.emit()

func _on_area_entered(area: Area2D) -> void:
	player_is_in = true
	
func _on_area_exited(area: Area2D) -> void:
	player_is_in = false
		
