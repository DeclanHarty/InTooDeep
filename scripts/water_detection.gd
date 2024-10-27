extends Area2D

var in_water : bool = true
# Called when the node enters the scene tree for the first time.

func _on_area_2d_body_entered(_body: Node2D) -> void:
	print("Entered air bubble")
	%OxygenManager.stop_depleting()
	%Player.exit_water()


func _on_area_2d_body_exited(_body: Node2D) -> void:
	%OxygenManager.start_depleting()
	%Player.enter_water()
	print("Exited air bubble")


func _on_area_entered(area: Area2D) -> void:
	print("Entered air bubble")
	%OxygenManager.stop_depleting()
	%Player.exit_water()


func _on_area_exited(area: Area2D) -> void:
	%OxygenManager.start_depleting()
	%Player.enter_water()
	print("Exited air bubble")
