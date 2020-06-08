extends Control


onready var TextLines = $CanvasLayer/MarginContainer/VBoxContainer/TextLines
onready var TextField = $CanvasLayer/MarginContainer/VBoxContainer/TextField
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
	var display = DisplayDefault.instance()
	display.string = string
	TextLines.add_child(display)


