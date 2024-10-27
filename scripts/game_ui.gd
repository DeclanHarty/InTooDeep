extends Control

func _ready():
	$OxygenBar.max_value = %OxygenManager.get_oxygen()
	$MaxOxygenBar.max_value = %OxygenManager.get_oxygen()

func _on_oxygen_manager_oxygen_changed(oxygen: float):
	$OxygenBar.value = oxygen

func _on_oxygen_manager_permanent_oxygen_changed(oxygen):
	$MaxOxygenBar.value = oxygen

func _on_glowstick_manager_glowstick_num_change(num_of_glowsticks: int) -> void:
	$GlowstickCount.text = str(num_of_glowsticks)

var state = "NORMAL"

func _on_oxygen_manager_oxygen_state_changed(state: String):
	self.state = state
	match state:
		"LOW":
			$OxygenBar.create_tween().tween_property($OxygenBar, "modulate:g", 0, 0.5)
			$OxygenBar.create_tween().tween_property($OxygenBar, "modulate:b", 0, 0.5)
		"NORMAL":
			$OxygenBar.create_tween().tween_property($OxygenBar, "modulate:g", 1, 0.5)
			$OxygenBar.create_tween().tween_property($OxygenBar, "modulate:b", 1, 0.5)
		"LOW_PERM":
			$MaxOxygenBar.create_tween().tween_property($MaxOxygenBar, "modulate:g", 0, 0.5)
			$MaxOxygenBar.create_tween().tween_property($MaxOxygenBar, "modulate:b", 0, 0.5)

func _on_player_water_state_changed(in_water):
	# if it heals past the normal threshold it turns blue but i don't care it's a feature
	if in_water:
		$OxygenBar.create_tween().tween_property($OxygenBar, "modulate:r", 0, 0.5)
		$OxygenBar.create_tween().tween_property($OxygenBar, "modulate:g", 1, 0.5)
		$OxygenBar.create_tween().tween_property($OxygenBar, "modulate:b", 0, 0.5)
	else:
		$OxygenBar.create_tween().tween_property($OxygenBar, "modulate:r", 1, 0.5)
		_on_oxygen_manager_oxygen_state_changed(state)
