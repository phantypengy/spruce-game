extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@onready var glorp = $Sprite2D
@onready var first_texture = load("res://assets/glorp.png")
@onready var second_texture = load("res://assets/glorp2.jpg")


func _process(_delta: float) -> void:
	if (Input.is_action_just_pressed("play_sound")):
		glorp.set_texture(second_texture)
	if (Input.is_action_just_released("play_sound")):
		glorp.set_texture(first_texture)


# stock 2D movement function but i added up and down too
func _physics_process(_delta: float) -> void:
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
