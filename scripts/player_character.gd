extends CharacterBody2D
class_name Player

@export var move_speed = 300.0
@export var jump_velocity = -400.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var debug_label: Label = $DebugLabel
@onready var animation_player: AnimationPlayer = $AnimationPlayer
