class_name OxygenManager
extends Node

signal oxygen_changed(oxygen: int)

@export var oxygen_max: int
@export var permanent_oxygen_depletion_per_seconds: float
@export var oxygen_depletion_per_seconds: float
var oxygen_tank: float
var permanent_oxygen_tank: float
var is_depleting = false

# separate public methods to deplete and stop depleting
func start_depleting():
	is_depleting = true

func stop_depleting():
	is_depleting = false

func get_oxygen() -> float:
	return oxygen_tank

func _ready():
	oxygen_tank = oxygen_max
	permanent_oxygen_tank = oxygen_max

func _process(delta: float):
	permanent_oxygen_tank -= permanent_oxygen_depletion_per_seconds * delta
		
	# the oxygen tank MUST fill or deplete
	if is_depleting:
		oxygen_tank -= oxygen_depletion_per_seconds * delta
		oxygen_tank = clamp(oxygen_tank, 0, permanent_oxygen_tank)
		oxygen_changed.emit(oxygen_tank)
	# TODO: if the tank is to be neutral add a third branch in both spots
	else:
		oxygen_tank += oxygen_depletion_per_seconds * delta
		oxygen_tank = clamp(oxygen_tank, 0, permanent_oxygen_tank)
		oxygen_changed.emit(oxygen_tank)
	
	# game over logic and you DIE loser
	if oxygen_tank <= 0:
		# TODO: write game over logic or call method
		pass
