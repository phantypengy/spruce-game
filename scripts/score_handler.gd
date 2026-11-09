extends Node2D

var score: int = 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


func _process(_delta: float) -> void:
	$Label.text = "Score: " + str(score)

	
func calculate_score(distance: float) -> void:
	if (distance < 20): # perfect score
		print("Perfect!")
		score += 50
	elif (distance < 40): # great score
		print("Great!")
		score += 35
	elif (distance < 80): # good score
		print("Good.")
		score += 15
	else: # miss
		print("Miss...")
		score += 0
	
