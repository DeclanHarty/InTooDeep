extends Area2D

signal waterStateChanged(in_water : bool)

var in_water : bool = true
# Called when the node enters the scene tree for the first time.

func _on_player_child_entered_tree(node: Node) -> void:
	in_water = false
	print(in_water)
	waterStateChanged.emit(in_water)


func _on_player_child_exiting_tree(node: Node) -> void:
	in_water = true
	print(in_water)
	waterStateChanged.emit(in_water)
