extends Area2D
@onready var sfx: AudioStreamPlayer = $SFX

func _on_body_entered(_body: Node2D) -> void:
	print("lvl passed")
	sfx.play()
	await sfx.finished
	get_tree().change_scene_to_file("res://scene/level_passed.tscn")

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("reset"):
		get_tree().change_scene_to_file("res://scene/main.tscn")
		Gamemanager.health = 3
