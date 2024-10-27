extends Area2D

func _ready():
	self.body_entered.connect(_on_body_entered)
	self.body_exited.connect(_on_body_exited)

func _on_body_entered(body: Node2D) -> void:
	%OxygenManager.stop_depleting()
	%Player.exit_water()
	
func _on_body_exited(body: Node2D) -> void:
	%OxygenManager.start_depleting()
	%Player.enter_water()
