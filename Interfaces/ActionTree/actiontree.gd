extends Node2D

var selected_node = null


func _ready():
	selected_node = null


func _process(delta):
	if selected_node == null:
		visible = false
		position.x = 0
		position.y = 0
		
	else:
		visible = true
		position.x = selected_node.position.x
		position.y = selected_node.position.y
		


func _on_TalkButton_input_event(_viewport, event, _shape_idx):
	if event.is_action_pressed('left_click'):
		print('Talk')


func _on_LookButton_input_event(_viewport, event, _shape_idx):
	if event.is_action_pressed('left_click'):
		print('Look')


func _on_TakeButton_input_event(_viewport, event, _shape_idx):
	if event.is_action_pressed('left_click'):
		print('Take')
