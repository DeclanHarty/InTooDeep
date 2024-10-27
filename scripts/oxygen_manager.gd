class_name OxygenManager
extends Node

signal oxygen_changed(oxygen: float)
signal permanent_oxygen_changed(oxygen: float)
signal out_of_oxygen
signal oxygen_state_changed(state: String)

@export var oxygen_max: int
@export var permanent_oxygen_depletion_per_seconds: float
@export var oxygen_depletion_per_seconds: float
@export var oxygen_refill_per_seconds: float
const LOW_OXYGEN = 250
const LOW_PERM_OXYGEN = 250
var oxygen_tank: float
var permanent_oxygen_tank: float
var is_depleting = true

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
	# permanent tank
	if is_depleting:
		var previous_permanent_tank = permanent_oxygen_tank
		permanent_oxygen_tank -= permanent_oxygen_depletion_per_seconds * delta
		permanent_oxygen_tank = max(permanent_oxygen_tank, 0)
		permanent_oxygen_changed.emit(permanent_oxygen_tank)
		if previous_permanent_tank >= LOW_PERM_OXYGEN and permanent_oxygen_tank < LOW_PERM_OXYGEN:
				oxygen_state_changed.emit("PERM_LOW")
		
	# the oxygen tank MUST fill or deplete
	var previous_tank = oxygen_tank
	if is_depleting:
		oxygen_tank -= oxygen_depletion_per_seconds * delta
		oxygen_tank = clamp(oxygen_tank, 0, permanent_oxygen_tank)
		oxygen_changed.emit(oxygen_tank)
		# changing state for progress bar
		if previous_tank >= LOW_OXYGEN and oxygen_tank < LOW_OXYGEN:
			oxygen_state_changed.emit("LOW")
	# TODO: if the tank is to be neutral add a third branch in both spots
	else:
		oxygen_tank += oxygen_refill_per_seconds * delta
		oxygen_tank = clamp(oxygen_tank, 0, permanent_oxygen_tank)
		oxygen_changed.emit(oxygen_tank)
		# changing state for progress bar
		if previous_tank < LOW_OXYGEN and oxygen_tank >= LOW_OXYGEN:
			oxygen_state_changed.emit("NORMAL")
	
	# game over logic and you DIE loser
	if oxygen_tank <= 0:
		out_of_oxygen.emit()
