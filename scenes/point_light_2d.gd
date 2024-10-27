extends PointLight2D

const MAX_LIGHT_CHANGE : float = .05
const BASE_LIGHTSCALE : float = .5
const LIGHT_CHANGE_SPEED : float = 3
var time = 0
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	time += delta
	texture_scale = BASE_LIGHTSCALE + sin(time * LIGHT_CHANGE_SPEED) * MAX_LIGHT_CHANGE
