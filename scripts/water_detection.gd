extends Area2D

signal waterStateChanged(in_water : bool)

var in_water : bool = true
# Called when the node enters the scene tree for the first time.

func _on_area_2d_body_entered(body: Node2D) -> void:
	in_water = false
	print("Entered air bubble")
	waterStateChanged.emit(in_water)


func _on_area_2d_body_exited(body: Node2D) -> void:
	in_water = true
	print("Exited air bubble")
	waterStateChanged.emit(in_water)
