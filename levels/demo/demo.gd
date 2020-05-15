extends Node2D

onready var nav_2d : Navigation2D = get_node("Navigation/Navigation2D")
onready var character : KinematicBody2D = null

func _unhandled_input(event: InputEvent) -> void:
	
	if not event is InputEventMouseButton:
		return
	if event.button_index != BUTTON_LEFT or not event.pressed:
		return
		
	if has_node("Constants/Player"):
		var new_path : = nav_2d.get_simple_path(character.global_position, get_global_mouse_position(), false)
		character.path = new_path		

