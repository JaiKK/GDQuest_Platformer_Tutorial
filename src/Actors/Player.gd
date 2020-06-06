extends Actor

func _physics_process(delta: float) -> void:
	var directions = get_direction()
	var is_jump_intruppted: bool = Input.is_action_just_released("jump") and _velocity.y < 0.0
	_velocity = calculate_move_velocity(_velocity, directions, speed, is_jump_intruppted)
	_velocity =  move_and_slide(_velocity, FLOOR_NORMAL)
	#_velocity = move_and_slide(_velocity)

func get_direction() -> Vector2:
	return Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"), 
		-1.0 if Input.get_action_strength("jump") and is_on_floor() else 1.0
	)

func calculate_move_velocity(
		linear_velocity: Vector2,
		direction: Vector2,
		speed: Vector2,
		is_jump_intruppted: bool
	) -> Vector2:
	var out: = linear_velocity
	out.x = speed.x * direction.x
	out.y += gravity * get_physics_process_delta_time()
	if direction.y == -1.0:
		out.y = speed.y * direction.y
	if is_jump_intruppted:
		out.y = 0.0
	return out
	#speed * directions
