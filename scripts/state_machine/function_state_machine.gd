extends Node

@export var player : Player

## TODO Add other needed states
enum States {IDLE, RUNNING, JUMPING, FALLING, CLIMBING, WALL}
var state: States = States.IDLE

## What the player should be doing in the state its in
func _physics_process(delta: float) -> void:
	if state != null:
		_apply_function()
		var new_state = _transition_logic(delta)
		if new_state != null:
			set_state(new_state)
			
## Continuous Function
func _apply_function():
	player.debug_label.text = "STATE: " + str(state)
	match state:
		States.IDLE:
			pass
		States.RUNNING:
			move()
		States.JUMPING:
			move()
		States.FALLING:
			move()
		States.CLIMBING:
			pass
		States.WALL:
			pass

## Get the logic to transition between states
func _transition_logic(delta):
	match state:
		States.IDLE:
			if !player.is_on_floor():
				if player.velocity.y > 0:
					return States.JUMPING
				elif player.velocity.y < 0:
					return States.FALLING
			if player.velocity.x != 0:
				return States.RUNNING
		States.RUNNING:
			if !player.is_on_floor():
				if player.velocity.y > 0:
					return States.JUMPING
				elif player.velocity.y < 0:
					return States.FALLING
			if player.velocity.x == 0: 
				return States.IDLE
		States.JUMPING:
			if player.is_on_floor():
				if player.velocity.x == 0:
					return States.IDLE
				elif player.velocity.x != 0:
					return States.RUNNING
			if player.velocity.y < 0:
				return States.FALLING
		States.FALLING:
			if player.is_on_floor():
				if player.velocity.x == 0:
					return States.IDLE
				elif player.velocity.x != 0:
					return States.RUNNING
			if player.velocity.y > 0:
				return States.JUMPING
			pass
		States.CLIMBING:
			pass
		States.WALL:
			pass

func _enter_state(new_state, prev_state):
	match state:
		States.IDLE:
			pass
		States.RUNNING:
			pass
		States.JUMPING:
			pass
		States.FALLING:
			pass
		States.CLIMBING:
			pass
		States.WALL:
			pass
	
func _exit_state(prev_state, new_state):
	match state:
		States.IDLE:
			pass
		States.RUNNING:
			pass
		States.JUMPING:
			pass
		States.FALLING:
			pass
		States.CLIMBING:
			pass
		States.WALL:
			pass

func move():
	var input_direciton_x = Input.get_axis("move_left", "move_right")
	
	if input_direciton_x < 0:
		player.sprite.flip_h = true
	elif input_direciton_x > 0:
		player.sprite.flip_h = false
	
	player.velocity.x = player.move_speed * input_direciton_x
	
	player.move_and_slide()
	
func jump():
	player.velocity.y += player.jump_velocity
	player.debug_label.text = "STATE: Jumping"

func set_state(new_state):
	var prev_state = state
	state = new_state
	
	if prev_state != null:
		_exit_state(prev_state, new_state)
	if new_state != null:
		_enter_state(new_state, prev_state)
