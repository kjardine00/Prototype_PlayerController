extends CharacterBody2D
class_name Player

@export var debug : bool = true

@export var move_speed = 150
@export var jump_velocity = -400.0


var can_run : bool = true

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var debug_label: Label = $DebugLabel
@onready var animation_player: AnimationPlayer = $AnimationPlayer

## TODO Set this using the player controlls to determine throw/attack direction
var input_direction : Vector2

## TODO Setup inventory to change player controls based on available inventory
var equip_slot_1
var equip_slot_2

## TODO Setup Equipment Effects that can give the player Dash/Wall_Jump/ETC
var inv_head
var inv_chest
var inv_boots

func _ready() -> void:
	pass
	
func _physics_process(delta: float) -> void:
	pass

func set_label_text(text: String):
	if debug:
		debug_label.text = text
