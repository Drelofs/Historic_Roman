extends Control

func _ready():
	visible = false
	$MarginContainer/VBoxContainer/VBoxContainer/TextureButton.grab_focus()
	
func _physics_process(_delta):
	if $MarginContainer/VBoxContainer/VBoxContainer/TextureButton.is_hovered() == true:
		$MarginContainer/VBoxContainer/VBoxContainer/TextureButton.grab_focus()
	if $MarginContainer/VBoxContainer/VBoxContainer/TextureButton2.is_hovered() == true:
		$MarginContainer/VBoxContainer/VBoxContainer/TextureButton2.grab_focus()	


func _input(event):
	if event.is_action_pressed("pause"):
		var new_pause_state = not get_tree().paused;
		get_tree().paused = new_pause_state
		visible = new_pause_state


func _on_TextureButton2_pressed():
	get_tree().quit()


func _on_TextureButton_pressed():
	get_tree().paused = false
	visible = false
