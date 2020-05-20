extends Node2D


const next_level = 'res://Levels/DebugLevel1/DebugLevel1.tscn'


func _ready():
	pass # Replace with function body.


func _input( event ):
	if event.is_action_pressed("ui_up"):
		Global.spawn_player( 100, 100 )
	
	if event.is_action_pressed("ui_down"):
		Global.remove_player()
	
	if event.is_action_pressed("ui_left"):
		Global.goto_scene( next_level , true, 300, 300 )
