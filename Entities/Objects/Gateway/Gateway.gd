extends Area2D


export(PackedScene) var go_to 		# De bestemmingslocatie
export var with_player = true 		# Of de speler op de bestemming moet verschijnen
export var player_x = 0 			# locatie van speler op bestemming
export var player_y = 0 			# locatie van speler op bestemming
export var locked = false 			# Of de doorgang gebruikt worden


func _on_Gateway_input_event(_viewport, event, _shape_idx):
	print('oooo')
	if event.is_action_pressed('left_click') && !locked && go_to:
		var _path = go_to.get_path()
		Global.go_to_level( _path, with_player, player_x, player_y )
