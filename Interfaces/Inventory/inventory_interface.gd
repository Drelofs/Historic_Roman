extends CanvasLayer

var inv = []

func _ready():
	$TextureRect.visible = false
	#$TextureRect.get_shape().set_extents(Vector2(50,50))
	
func updateInventory(node):
	var obj = {
		"name": node.object_name,
		"desc": node.description,
		"texture": node.get_node("Sprite").texture
	}
	inv.append(obj)
	print(inv)
	var s = Sprite.new();
	s.texture = obj["texture"]
	self.add_child(s)
	s.position.x = 1820 + 50
	s.position.y = (inv.size() - 1) * 100 + 50
	s.set_scale(Vector2(0.5,0.5))
	var n = get_node("TextureRect")
	n.visible = true;
	n.set_size(Vector2(50, 100 * inv.size()))
func _process(_delta):
	if inv.size() > 0 : $TextureRect.visible = true
