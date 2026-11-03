extends Sprite2D

@export var key_name : String = ""
@export var falling_key = preload("res://scenes/falling_keys.tscn")

var falling_key_queue = []

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if falling_key_queue.size() > 0:
		# destroys arrows that have gone past the input threshold
		if not is_instance_valid(falling_key_queue.front()):
			falling_key_queue.pop_front()
		
		# handles destroying arrows on input & grabs distance from target on destroy
		if Input.is_action_just_pressed(key_name):
			var key_to_pop = falling_key_queue.pop_front()
			var distance_from_target = abs(key_to_pop.pass_threshold - key_to_pop.global_position.y)
			
			print(distance_from_target)
			
			if (distance_from_target < 20):
				print("Perfect!");
			elif (distance_from_target < 50):
				print("Good")
			else:
				print("Miss")
			
			key_to_pop.queue_free()


# create an arrow (wow)
func create_falling_key() -> void:
	var fk_inst = falling_key.instantiate()
	get_tree().get_root().call_deferred("add_child", fk_inst)
	fk_inst.setup(position.x, frame + 4)
	
	falling_key_queue.push_back(fk_inst)


# randomly spawn arrows
func _on_random_spawn_timeout() -> void:
	create_falling_key()
	$RandomSpawn.wait_time = randf_range(1, 3)
	$RandomSpawn.start()
