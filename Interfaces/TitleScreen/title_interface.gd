extends Control

const next_scene = 'res://Levels/DebugLevel1/debug_level_1.tscn'

func _ready():
	$CanvasLayer/MarginContainer/VBoxContainer/VBoxContainer/TextureButton.grab_focus()
	
func _physics_process(_delta):
	if $CanvasLayer/MarginContainer/VBoxContainer/VBoxContainer/TextureButton.is_hovered():
		$CanvasLayer/MarginContainer/VBoxContainer/VBoxContainer/TextureButton.grab_focus()
	if $CanvasLayer/MarginContainer/VBoxContainer/VBoxContainer/TextureButton2.is_hovered():
		$CanvasLayer/MarginContainer/VBoxContainer/VBoxContainer/TextureButton2.grab_focus()	

func _on_TextureButton2_pressed():
	get_tree().quit()

func _on_TextureButton_pressed():
	Global.go_to_level( next_scene, true, 100, 100 )
