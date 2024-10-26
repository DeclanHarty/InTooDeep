class_name OxygenManager
extends Node

signal oxygen_changed(oxygen: int)

@export var oxygen_max: int
@export var oxygen_depletion_per_seconds: float
var _oxygen_tank: float
var _is_depleting = false

# separate public methods to deplete and stop depleting
func start_depleting():
	_is_depleting = true

func stop_depleting():
	_is_depleting = false

func get_oxygen() -> float:
	return _oxygen_tank

func _ready():
	_oxygen_tank = oxygen_max

func _process(delta: float):
	if (_is_depleting):
		_oxygen_tank -= oxygen_depletion_per_seconds * delta
		oxygen_changed.emit(_oxygen_tank)
