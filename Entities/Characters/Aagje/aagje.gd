extends Node2D

onready var animation_node = $AnimationTree
export(float, 0.0, 1.0) var walking


func _physics_process(_delta):
	animation_node.set("parameters/Movement/blend_amount", walking)
