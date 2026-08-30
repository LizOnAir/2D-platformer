extends CanvasLayer
@onready var health_1: NinePatchRect = $HBoxContainer/health1
@onready var health_2: NinePatchRect = $HBoxContainer/health2
@onready var health_3: NinePatchRect = $HBoxContainer/health3
@onready var dead_1: NinePatchRect = $HBoxContainer/dead1
@onready var dead_2: NinePatchRect = $HBoxContainer/dead2
@onready var dead_3: NinePatchRect = $HBoxContainer/dead3

func _ready() ->void:
	if Gamemanager.health == 3:
		health_1.visible = true
		health_2.visible = true
		health_3.visible = true
		dead_1.visible = false
		dead_2.visible = false
		dead_3.visible = false
	
	if Gamemanager.health == 2:
		health_1.visible = true
		health_2.visible = true
		health_3.visible = false
		dead_1.visible = true
		dead_2.visible = false
		dead_3.visible = false
	if Gamemanager.health == 1:
		health_1.visible = true
		health_2.visible = false
		health_3.visible = false
		dead_1.visible = true
		dead_2.visible = true
		dead_3.visible = false
