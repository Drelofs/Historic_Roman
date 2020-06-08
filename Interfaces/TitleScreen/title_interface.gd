extends Control

const next_scene = 'res://Levels/Introduction/introduction.tscn'
onready var Background = $CanvasLayer/TextureRectWhite
var value = 0

func _process(delta):
	value += delta / 2
	var cutoff = abs(sin(value)) * 0.1 + 0.8
	Background.material.set_shader_param('cutoff', cutoff)


func _on_Spelen_pressed():
	Global.go_to_level( next_scene, false )


func _on_Afsluiten_pressed():
	get_tree().quit()
