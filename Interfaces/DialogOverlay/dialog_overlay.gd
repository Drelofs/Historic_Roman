extends Control


onready var TextLines = $CanvasLayer/MarginContainer/VBoxContainer/TextLines
onready var DisplayDefault = preload("res://Interfaces/DialogOverlay/DisplayDefault/display_default.tscn")
var textlog = []


func _process(delta):
	textlog = TextLines.get_children()
	if textlog.size() > 2:
		textlog.front().queue_free()


func show_text( string ):
	var display = DisplayDefault.instance()
	display.string = string
	TextLines.add_child(display)


func show_dialog( string, speaker ):
	pass


