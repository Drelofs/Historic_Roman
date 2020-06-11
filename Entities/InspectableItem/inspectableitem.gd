extends Node


export var description = "Wat een vreemd object."
export var object_name = "Object"
var taken = false

func _on_InspectableItem_input_event(viewport, event, shape_idx):
	if Global.active_actiontree != null && event.is_action_pressed('left_click'):
			if Global.active_actiontree.selected_node == self:
				Global.active_actiontree.selected_node = null
			else:
				Global.active_actiontree.request_selection( self )

func look():
	Global.active_actiontree.selected_node = null
	Global.show_text( description )

func take():
	if(!taken):
		Global.get_node("Inventory").updateInventory(self)
		taken = true
		Global.active_actiontree.selected_node = null
		self.queue_free()

func talk():
	Global.active_actiontree.selected_node = null
	Global.show_text( "Waarom zou ik met een object praten?" )
