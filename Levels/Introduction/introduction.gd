extends Node2D


onready var Text = $Control/ColorRect/Label
var next_level = "res://Levels/Tutorial/tutorial.tscn"
var opacity = 0


func _ready():
	pass # Replace with function body.


func _process(delta):
	opacity += .005
	opacity = clamp( opacity, 0, 1 )
	Text.modulate.a = opacity


func _on_Timer_timeout():
	Global.go_to_level( next_level, false )
	
