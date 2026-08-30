extends Control

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("reset"):
		get_tree().change_scene_to_file("res://scene/main.tscn")
		Gamemanager.health = 3
