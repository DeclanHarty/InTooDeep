extends Area2D

signal waterStateChanged(in_water : bool)

var in_water : bool = true
# Called when the node enters the scene tree for the first time.

func _on_body_exited(body: Node2D) -> void:
	var overlapping_bodies = get_overlapping_bodies()
	
	if (overlapping_bodies == 0):
		in_water = false
		print(in_water)
		waterStateChanged.emit(in_water)
	

func _on_body_entered(body: Node2D) -> void:
	if (in_water == false):
		var overlapping_bodies = get_overlapping_bodies()
	
		if (overlapping_bodies >= 1):
			in_water = true
			print(in_water)
			waterStateChanged.emit(in_water)
