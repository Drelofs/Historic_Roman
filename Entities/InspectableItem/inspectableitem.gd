extends Node


var description = "Wat een vreemd object."


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
	Global.show_text( "Ik heb dit niet nodig." )

func talk():
	Global.active_actiontree.selected_node = null
	Global.show_text( "Waarom zou ik met een object praten?" )
