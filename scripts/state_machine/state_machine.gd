extends Node
class_name StateMachine

var input_state: int:
	set(new_value):
		
		input_state_exit(input_state)
				
		input_state = new_value
		
		input_state_enter(input_state)
		
	get:
		return input_state

func input_state_exit(STATE: int) -> void:
	pass
	
func input_state_enter(STATE: int) -> void:
	pass
