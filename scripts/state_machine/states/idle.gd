extends State

func enter_state(from_state: String, data := {}) -> void:
	character.velocity.x = 0.0
	character.debug_label.text = "STATE: Idle"
	character.animation_player.play("idle")

func physics_update(_delta: float) -> void:
	character.velocity.y += character.gravity * _delta
	character.move_and_slide()

	##====================== Change State Logic ======================
	if not character.is_on_floor():
		finished.emit(FALLING)
	elif Input.is_action_just_pressed("move_jump"):
		finished.emit(JUMPING)
	elif Input.is_action_pressed("move_left") or Input.is_action_pressed("move_right"):
		finished.emit(RUNNING)
