extends MarginContainer

@export var start: Button

func _ready() -> void:
	start.mouse_entered.connect(_on_mouse_entered)
	start.mouse_exited.connect(_on_mouse_exited)

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/main.tscn")


func _on_mouse_entered() -> void:
	start.pivot_offset = start.size / 2
	var tween = create_tween()
	tween.tween_property(start, "scale", Vector2.ONE * 1.3, 0.1)

func _on_mouse_exited() -> void:
	var tween = create_tween()
	tween.tween_property(start, "scale", Vector2.ONE, 0.1)
