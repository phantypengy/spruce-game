extends Node2D

var numbah = 231

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Label.text = "String " + str(numbah)
	pass
