extends Control


onready var TextLines = $CanvasLayer/MarginContainer/VBoxContainer/TextLines
onready var TextField = $CanvasLayer/MarginContainer/VBoxContainer/TextField
onready var InputText = $CanvasLayer/MarginContainer/VBoxContainer/TextField/MarginContainer/HBoxContainer/LineEdit
onready var DisplayDefault = preload("res://Interfaces/DialogOverlay/DisplayDefault/display_default.tscn")
onready var DisplayDialog = preload("res://Interfaces/DialogOverlay/DisplayDialog/display_dialog.tscn")
var textlog = []
var textfield_visible = false


func _process(_delta):
	textlog = TextLines.get_children()
	if textlog.size() > 2:
		textlog.front().queue_free()
	
	TextField.visible = textfield_visible


func show_text( string ):
	var display = DisplayDefault.instance()
	display.string = string
	TextLines.add_child(display)


func show_dialog( string, speaker ):
	var display = DisplayDialog.instance()
	display.speaker = speaker
	display.string = string
	TextLines.add_child(display)


func clear():
	for i in textlog:
		if i.is_in_group("dialog"):
			i.queue_free()
			textlog.erase(i)

func _on_Versturen_pressed():
	var text = InputText.text
	show_dialog( text, "Aagje" )
	Global.send_to_api( text )
	InputText.text = ""
