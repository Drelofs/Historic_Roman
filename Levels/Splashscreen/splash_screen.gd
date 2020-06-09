extends Node2D

const next_scene = 'res://Levels/TitleScreen/title_screen.tscn'

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	yield(get_tree().create_timer(2.2), "timeout")

	Global.go_to_level( next_scene, false)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			Global.go_to_level( next_scene, false)
