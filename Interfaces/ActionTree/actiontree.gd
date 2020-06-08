extends Node2D

var selected_node = null
var previous_state = selected_node
var buttons
var _start = 0


func _ready():
	selected_node = null
	buttons = get_tree().get_nodes_in_group('actiontree_buttons')
	_position_buttons()


func _process(delta):
	if selected_node == null:
		if position.x == 0 && position.y == 0:
			visible=true
		if previous_state != selected_node:
			previous_state = selected_node
			$AnimationPlayer.play_backwards("Fade")
		
	else:
		visible = true
		_position_buttons()
		if previous_state != selected_node:
			position.x = selected_node.position.x
			position.y = selected_node.position.y
			$Ring.material.set_shader_param('cutoff', 1)
			for i in range( buttons.size() ):
				buttons[i].get_node('Sprite').material.set_shader_param('cutoff', 0)
			$AnimationPlayer.play("Fade")
			previous_state = selected_node


func _position_buttons():
	var _radius =  round( $Ring.texture.get_height() * scale.y)
	for i in range( buttons.size() ):
		var _angle = deg2rad( 360 / buttons.size() * i + 180 )
		var _x = sin(_angle) * _radius
		var _y = cos(_angle) * _radius
		buttons[i].position.x = _x
		buttons[i].position.y = _y


func request_selection( node ):
	if Global.active_player:
		if !Global.active_player.conversation_partner:
			selected_node = node


func _on_TalkButton_input_event(_viewport, event, _shape_idx):
	if event.is_action_pressed('left_click') && selected_node:
		selected_node.talk()


func _on_LookButton_input_event(_viewport, event, _shape_idx):
	if event.is_action_pressed('left_click') && selected_node:
		selected_node.look()


func _on_TakeButton_input_event(_viewport, event, _shape_idx):
	if event.is_action_pressed('left_click') && selected_node:
		selected_node.take()
