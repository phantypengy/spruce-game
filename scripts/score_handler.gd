extends Node2D

var score: int = 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


func _process(_delta: float) -> void:
	$Label.text = "Score: " + str(score)

	
func calculate_score(distance: float) -> void:
	if (distance < 20): # perfect score
		score += 50
	elif (distance < 40): # great score
		score += 35
	elif (distance < 80): # good score
		score += 15
	else: # miss
		score += 0
	
