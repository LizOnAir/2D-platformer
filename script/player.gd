extends CharacterBody2D

const SPEED = 600.0
const JUMP_VELOCITY = -550.0
var left = false
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var killzone: Area2D = $"../Killzone"

func _ready():
	if Gamemanager.health > 0:
		pass
	else:
		get_tree().change_scene_to_file("res://scene/game_over.tscn")

	killzone.health_deduction.connect(health_system)

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction := Input.get_axis("left", "right")
	
	#Apply Movement
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide()
	
	#Animation
	if direction < 0:
		left = true
		if is_on_floor():
			animated_sprite_2d.play("Left")
			$AnimatedSprite2D.speed_scale = 3.0
		else:
			animated_sprite_2d.play("Jump left")
	elif direction ==0:
		if left:
			if is_on_floor():
				animated_sprite_2d.play("Left")
				$AnimatedSprite2D.speed_scale = 1.0
			else:
				animated_sprite_2d.play("Jump left")
		else:
			if is_on_floor():
				animated_sprite_2d.play("Right")
				$AnimatedSprite2D.speed_scale = 1.0
			else:
				animated_sprite_2d.play("Jump right")
			
	else:
		left = false
		if is_on_floor():
			animated_sprite_2d.play("Right")
			$AnimatedSprite2D.speed_scale = 3.0
		else:
			animated_sprite_2d.play("Jump right")

func health_system(amount: int) -> int:
	Gamemanager.health -= amount
	print(Gamemanager.health)
	return Gamemanager.health
