extends Sprite2D


@export var fall_speed : float = 500 # pixels per second

var init_y_position : float = -75 # just outside of the screen; where the arrows spawn
var has_passed : bool = false # true if falling arrow passes input frames
var pass_threshold : float = 1000 # y position of the targets


func _init() -> void:
	set_process(false)


func _process(delta: float) -> void:
	# makes arrow fall
	global_position += Vector2(0, fall_speed * delta)
	
	# checks how long arrow takes to hit target
	# at fall_speed = 500 it's around 2.15 seconds
	if global_position.y > pass_threshold and not $Timer.is_stopped():
		print($Timer.wait_time - $Timer.time_left)
		$Timer.stop()
		has_passed = true
	


# sets up the spawn location & sprite to use for arrows
func setup(target_x : float, target_frame : int) -> void:
	frame = target_frame
	global_position = Vector2(target_x, init_y_position)
	set_process(true)


# after 2.5 seconds, destroy object
func _on_destroy_timer_timeout() -> void:
	queue_free()
