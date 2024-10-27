extends Control

func _ready():
	$OxygenBar.max_value = %OxygenManager.get_oxygen()

func _on_oxygen_manager_oxygen_changed(oxygen: float):
	$OxygenBar.value = oxygen

func _on_oxygen_manager_permanent_oxygen_changed(oxygen):
	$MaxOxygenBar.value = oxygen

func _on_glowstick_manager_glowstick_num_change(num_of_glowsticks: int) -> void:
	$GlowstickCount.text = str(num_of_glowsticks)
