extends Control

@onready var _oxygen_bar: ProgressBar = $OxygenBar

func _ready():
	_oxygen_bar.max_value = %OxygenManager.get_oxygen()
func _on_oxygen_manager_oxygen_changed(oxygen: float):
	_oxygen_bar.value = oxygen
	print(oxygen)
