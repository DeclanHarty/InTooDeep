extends Control

func _ready():
	$OxygenBar.max_value = %OxygenManager.get_oxygen()

func _on_oxygen_manager_oxygen_changed(oxygen: float):
	$OxygenBar.value = oxygen

func _on_oxygen_manager_permanent_oxygen_changed(oxygen):
	$MaxOxygenBar.value = oxygen

func _on_glowstick_manager_glowstick_num_change(num_of_glowsticks: int) -> void:
	$GlowstickCount.text = str(num_of_glowsticks)

func _on_oxygen_manager_oxygen_state_changed(state: String):
	match state:
		"LOW":
			$OxygenBar.create_tween().tween_property($OxygenBar, "modulate:g", 0, 1)
			$OxygenBar.create_tween().tween_property($OxygenBar, "modulate:b", 0, 1)
		"NORMAL":
			$OxygenBar.create_tween().tween_property($OxygenBar, "modulate:g", 1, 1)
			$OxygenBar.create_tween().tween_property($OxygenBar, "modulate:b", 1, 1)
		"LOW_PERM":
			$MaxOxygenBar.create_tween().tween_property($MaxOxygenBar, "modulate:g", 0, 1)
			$MaxOxygenBar.create_tween().tween_property($MaxOxygenBar, "modulate:b", 0, 1)
