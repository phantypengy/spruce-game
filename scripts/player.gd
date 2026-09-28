extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@onready var first_texture = load("res://assets/glorp.png")
@onready var second_texture = load("res://assets/glorp2.jpg")

func _physics_process(delta: float) -> void:
	
	if (Input.is_action_just_pressed("play_sound")):
		$Sprite2D.set_texture(second_texture)
	
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	var up_down := Input.get_axis("up", "down")
	if up_down:
		velocity.y = up_down * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()
