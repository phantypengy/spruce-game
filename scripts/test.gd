extends Node2D

var playSound = preload("res://assets/07.mp3")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("HI")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (!$AudioStreamPlayer2D.is_playing() && Input.is_action_just_pressed("play_sound")):
		$AudioStreamPlayer2D.stream = playSound
		$AudioStreamPlayer2D.play()
