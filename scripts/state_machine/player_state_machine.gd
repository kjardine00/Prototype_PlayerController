extends StateMachine
class_name PlayerStateMachine

@export var player: Player

enum INPUT_STATES {IDLE, RUNNING, JUMPING, FALLING}
var movement
var can_move = true
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready() -> void:
	pass
	
func _input(event: InputEvent) -> void:
	pass

func _physics_process(delta: float) -> void:
	
	movement = Input.get_axis("move_left", "move_right") * player.move_speed
	
	_state_transition_logic()
	player.velocity.y += gravity * delta
	
	if can_move: 
		player.velocity.x = movement
	
	player.move_and_slide()
	
	## NOTE: IDLE transition needs to be the last check
func _state_transition_logic(): 
	match input_state:
		INPUT_STATES.IDLE:
			if player.is_on_floor():
				if Input.is_action_pressed("move_left") || Input.is_action_pressed("move_right"):
					input_state = INPUT_STATES.RUNNING
				elif Input.is_action_pressed("move_jump"):
					input_state = INPUT_STATES.JUMPING
				elif player.velocity.y > 0: 
					input_state = INPUT_STATES.FALLING
		INPUT_STATES.RUNNING:
			if player.velocity.y > 0: 
				input_state = INPUT_STATES.FALLING
			elif player.is_on_floor():
				if Input.is_action_pressed("move_jump"):
					input_state = INPUT_STATES.JUMPING
			elif !Input.is_action_pressed("move_left") && !Input.is_action_pressed("move_right"):
				input_state = INPUT_STATES.IDLE
		INPUT_STATES.JUMPING:
			if player.velocity.y > 0: 
				input_state = INPUT_STATES.FALLING
			elif player.is_on_floor():
				if Input.is_action_pressed("move_left") || Input.is_action_pressed("move_right"):
					input_state = INPUT_STATES.RUNNING
				elif !Input.is_action_pressed("move_left") && !Input.is_action_pressed("move_right"): 
					input_state = INPUT_STATES.IDLE
		INPUT_STATES.FALLING:
			if player.is_on_floor():
				if Input.is_action_pressed("move_left") || Input.is_action_pressed("move_right"): 
					input_state = INPUT_STATES.RUNNING
				elif !Input.is_action_pressed("move_left") && !Input.is_action_pressed("move_right"):
					input_state = INPUT_STATES.IDLE
	
func input_state_exit(STATE: int) -> void:
	match STATE:
			INPUT_STATES.IDLE:
				pass
			INPUT_STATES.RUNNING:
				pass
			INPUT_STATES.JUMPING:
				pass
			INPUT_STATES.FALLING:
				pass
				
func input_state_enter(STATE: int) -> void:
	match STATE:
			INPUT_STATES.IDLE:
				player.set_label_text("STATE: IDLE")
				#print("idle")
			INPUT_STATES.RUNNING:
				player.set_label_text("STATE: RUNNING")
				#print("running")
			INPUT_STATES.JUMPING:
				player.set_label_text("STATE: JUMPING")
				player.velocity.y += player.jump_velocity
				#print("jumping")
			INPUT_STATES.FALLING:
				player.set_label_text("STATE: FALLING")
				#print("running")
