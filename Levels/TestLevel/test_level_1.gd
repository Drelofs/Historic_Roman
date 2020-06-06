extends Area2D
onready var Tree = preload("res://Interfaces/ActionTree/actiontree.tscn")
onready var Item = preload("res://Entities/InspectableItem/inspectableitem.tscn")
func _ready():
	Tree = Tree.instance();
	Item = Item.instance();
	self.add_child(Tree)
	self.add_child(Item)
