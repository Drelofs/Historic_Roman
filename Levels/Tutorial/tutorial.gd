extends Node2D


onready var Text = $Control/ColorRect/Label
onready var Rect = $Control/ColorRect/TextureRect
var next_level = "res://Levels/Level1/level_1.tscn"
var opacity = 0


func _ready():
	pass # Replace with function body.


func _process(delta):
	opacity += .005
	opacity = clamp( opacity, 0, 1 )
	Text.modulate.a = opacity
	Rect.modulate.a = opacity


func _on_Timer_timeout():
	Global.go_to_level( next_level, true, 1000, 1000 )
func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			Global.go_to_level( next_level, true, 1000, 1000 )
