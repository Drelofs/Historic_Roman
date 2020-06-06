extends Node
var sprite = Sprite.new();
var collision = CollisionShape2D.new();
func _ready():
	var x = CircleShape2D.new()
	x.set_radius(100)
	collision.set_shape(x);
	self.add_child(sprite);
	self.add_child(collision);
	sprite.texture = preload("res://Sprites/debug/debug_blue.png");
	collision.position.x = 200
	collision.position.y = 200
	sprite.position.x = 200
	sprite.position.y = 200

func _on_InspectableItem_input_event(viewport, event, shape_idx):
	if(Input.is_action_pressed("left_click")):
		get_parent().Tree.onObjectClick(self.sprite)
		
