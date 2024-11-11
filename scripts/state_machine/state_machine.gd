extends Node
class_name State_Machine

@export var init_state: State = null
@export var character: CharacterBody2D

@onready var state: State = (func get_initial_state() -> State:
	return init_state if init_state != null else get_child(0)
).call()
	
	
func _ready() -> void:
	for child in get_children():
		if child is State:
			child.finished.connect(_change_state)
			child.character = character
	await owner.ready
	state.enter_state("")

	
## Calls the states functions and handles its inputs
func _unhandled_input(event: InputEvent) -> void:
	state.handle_input(event)


func _process(delta: float) -> void:
	state.update_state(delta)


func _physics_process(delta: float) -> void:
	state.physics_update(delta)
	
	
func _change_state(to_state: String, data: Dictionary = {}) -> void:
	print(str(to_state))
	if not has_node(to_state):
		printerr(owner.name + ": State " + to_state + " does not exist")
		return
	
	var from_state := state.name
	state.exit_state()
	state = get_node(to_state)
	state.enter_state(from_state, data)
