extends State

func enter_state(from_state: String, data := {}) -> void:
	character.velocity.y += character.jump_velocity
	character.debug_label.text = "STATE: Jumping"
	
	
func physics_update(delta: float) -> void:
	var input_direciton_x = Input.get_axis("move_left", "move_right")
	character.velocity.x = character.move_speed * input_direciton_x
	character.velocity.y += character.gravity * delta
	character.move_and_slide()
	
##====================== Change State Logic ======================
	
	if character.velocity.y >= 0:
		finished.emit(FALLING)