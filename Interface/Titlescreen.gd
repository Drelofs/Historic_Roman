extends Control

func _ready():
	$CanvasLayer/MarginContainer/VBoxContainer/VBoxContainer/TextureButton.grab_focus()
	
func _physics_process(_delta):
	if $CanvasLayer/MarginContainer/VBoxContainer/VBoxContainer/TextureButton.is_hovered() == true:
		$CanvasLayer/MarginContainer/VBoxContainer/VBoxContainer/TextureButton.grab_focus()
	if $CanvasLayer/MarginContainer/VBoxContainer/VBoxContainer/TextureButton2.is_hovered() == true:
		$CanvasLayer/MarginContainer/VBoxContainer/VBoxContainer/TextureButton2.grab_focus()	

func _on_TextureButton2_pressed():
	get_tree().quit()


func _on_TextureButton_pressed():
	get_tree().change_scene("res://levels/demo/demo.tscn")
