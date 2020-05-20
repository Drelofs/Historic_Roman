tool
extends Area2D

onready var anim_player: AnimationPlayer = $AnimationPlayer
onready var player: KinematicBody2D = null
export var next_scene: PackedScene


func _get_configuration_warning() -> String:
	return "The next scene property can't be empty!" if not next_scene else ""


func teleport() -> void:
	anim_player.play("fade_to_black")
	yield(anim_player, "animation_finished")
	get_tree().change_scene_to(next_scene)


func _on_Stairs_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	player = ConstantsScene.get_node("Player")
	if event = InputEventMouseButton || event.pressed && event.button_index == BUTTON_RIGHT:
		teleport()
