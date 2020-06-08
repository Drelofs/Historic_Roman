extends Node


var description = "Cornelis zit rustig in zijn stoel. Had ik maar eens een rustdag."


func _on_InspectableItem_input_event(viewport, event, shape_idx):
	if Global.active_actiontree != null && event.is_action_pressed('left_click'):
			if Global.active_actiontree.selected_node == self:
				Global.active_actiontree.selected_node = null
			else:
				Global.active_actiontree.selected_node = self

func look():
	Global.active_actiontree.selected_node = null
	Global.show_text( description )

func take():
	Global.active_actiontree.selected_node = null
	Global.show_text( "Hij is iets te zwaar om op te tillen." )

func talk():
	Global.active_actiontree.selected_node = null
	Global.active_player.conversation_partner = self
