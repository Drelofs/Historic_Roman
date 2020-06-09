extends Node2D

var inv = [];

func _ready():
	var n = get_node("TextureRect")
	n.visible = false
	updateVisuals()
	n = get_node("CollisionShape2D")
	n.position.x = 500
	n.position.y = 300
	n.get_shape().set_extents(Vector2(50,50))
	
func updateInventory(node):
	inv.append(node)
	self.updateVisuals()

func updateVisuals():
	if inv.size() > 0:
		var n = get_node("TextureRect")
		n.visible = true;
		n.set_size(Vector2(50, 100 * inv.size()))
		n = get_node("CollisionShape2D")
		n.get_shape().set_extents(Vector2(100, 100 * inv.size()))
		for x in range(inv.size()):
			var item = inv[x]
			item.position.x = 1820 + 50
			item.position.y = x * 100 + 50
			item.z_index = 1
			item.set_scale(Vector2(0.5,0.5))

func _on_Node2D_input_event(viewport, event, shape_idx):
	print(200)
