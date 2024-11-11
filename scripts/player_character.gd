extends CharacterBody2D
class_name Player

@export var move_speed = 300.0
@export var jump_velocity = -400.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var debug_label: Label = $DebugLabel

func _ready() -> void:
	# Initialize the state machine, passing a reference of the player to the states,
	# that way they can move and react accordingly
	pass
	
#func _unhandled_input(event: InputEvent) -> void:
	#state_machine.process_input(event)
#
#func _physics_process(delta: float) -> void:
	#state_machine.process_physics(delta)
#
#func _process(delta: float) -> void:
	#state_machine.process_frame(delta)
