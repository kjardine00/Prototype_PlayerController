extends Node
class_name State

const IDLE = "Idle"
const RUNNING = "Running"
const JUMPING = "Jumping"
const FALLING = "Falling"

var character: CharacterBody2D

signal finished(next_state_path: String, data: Dictionary)

func handle_input(_event: InputEvent) -> void:
	pass
	
func update_state(delta) -> void: 
	pass
	
func physics_update(delta) -> void:
	pass

func enter_state(previous_state_path: String, data := {}) -> void:
	pass
	
func exit_state() -> void: 
	pass
