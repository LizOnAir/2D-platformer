extends Area2D

@onready var timer: Timer = $Timer

signal health_deduction(amount: int)

func _on_body_entered(body: Node2D):
	health_deduction.emit(1)
	timer.start()

func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()
