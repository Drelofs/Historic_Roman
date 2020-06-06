extends Area2D
var optionTextures = [preload("res://Sprites/Interfaces/actiontree_iconring.png"), preload("res://Sprites/Interfaces/actiontree_icontalk.png"), preload("res://Sprites/Interfaces/actiontree_iconeye.png"), preload("res://Sprites/Interfaces/actiontree_iconhand.png")]
var col = []; #node collection
func _ready():
	for x in range(4):
		#sprite
		var s = Sprite.new();
		s.set_texture(optionTextures[x]);
		col.push_back(s);
		self.add_child(s);
		#collision
		var c = CircleShape2D.new();
		if(x > 0):
			c.set_radius(150);
		else:
			c.set_radius(220);
		var collision = CollisionShape2D.new();
		collision.set_shape(c);
		self.add_child(collision);
		#positioning
		self.position.x = 500;
		self.position.y = 500;
		if(x == 1):
			s.position.x -= 400;
			s.position.y -= 200
			collision.position.x -= 400;
			collision.position.y -= 200
		if(x == 2):
			s.position.y -= 420;
			collision.position.y -= 420;
		if(x == 3):
			s.position.x += 400;
			s.position.y -= 200
			collision.position.x += 400;
			collision.position.y -= 200
		self.toggle()
func scale(scale):
	self.set_scale(Vector2(scale,scale))
	
func toggle():
	if(self.visible):
		self.visible = false;
	else:
		self.visible = true;

func onObjectClick(node):
	
	self.position.x = node.position.x
	self.position.y = node.position.y
	self.toggle()


func _on_actiontree_input_event(viewport, event, shape_idx):
	if(Input.is_action_pressed("left_click")):
		match(shape_idx):
			0:
				#open/close
				print("open/close")
			1:	
				#chat
				print("chat")
			2:
				#view
				print("view")
			3:
				#pickup
				print("pickup")
