extends Control

func _ready():
	visible = false
	$MarginContainer/VBoxContainer/VBoxContainer/Hervatten.grab_focus()


func _physics_process(_delta):
	if $MarginContainer/VBoxContainer/VBoxContainer/Hervatten.is_hovered() == true:
		$MarginContainer/VBoxContainer/VBoxContainer/Hervatten.grab_focus()
	if $MarginContainer/VBoxContainer/VBoxContainer/Afsluiten.is_hovered() == true:
		$MarginContainer/VBoxContainer/VBoxContainer/Afsluiten.grab_focus()	


func _input(event):
	if event.is_action_pressed("pause"):
		var new_pause_state = not get_tree().paused;
		get_tree().paused = new_pause_state
		visible = new_pause_state


func _on_Hervatten_pressed():
	get_tree().paused = false
	visible = false


func _on_Afsluiten_pressed():
	get_tree().quit()
