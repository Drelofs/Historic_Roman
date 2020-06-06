extends Area2D


onready var ActionTree = preload("res://Interfaces/ActionTree/actiontree.tscn")
onready var Item = preload("res://Entities/InspectableItem/inspectableitem.tscn")


func _ready():
	var _tree = ActionTree.instance();
	var _item = Item.instance();
	self.add_child(_tree)
	self.add_child(_item)
