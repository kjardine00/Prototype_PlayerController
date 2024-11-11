extends State

func enter_state(from_state: String, data := {}) -> void:
	character.debug_label.text = "STATE: Falling"

func physics_update(delta: float) -> void:
	var input_direciton_x = Input.get_axis("move_left", "move_right")
	character.velocity.x = character.move_speed * input_direciton_x
	character.velocity.y += character.gravity * delta
	character.move_and_slide()

	##====================== Change State Logic ======================
	if character.is_on_floor():
		if is_equal_approx(input_direciton_x, 0.0):
			finished.emit(IDLE)
		else:
			finished.emit(RUNNING)
