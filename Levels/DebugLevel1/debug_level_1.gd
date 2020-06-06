extends Node2D



func _ready():
	Global.spawn_player(1000,1000)


func _input( event ):
	if event.is_action_pressed("ui_up"):
		Global.spawn_actiontree()
	
	if event.is_action_pressed("ui_down"):
		Global.remove_actiontree()
