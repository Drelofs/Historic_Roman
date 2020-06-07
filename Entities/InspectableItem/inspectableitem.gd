extends Node


func _on_InspectableItem_input_event(viewport, event, shape_idx):
	if Global.active_actiontree != null && event.is_action_pressed('left_click'):
			if Global.active_actiontree.selected_node == self:
				Global.active_actiontree.selected_node = null
			else:
				Global.active_actiontree.selected_node = self

func look():
	pass

func take():
	pass

func talk():
	pass
