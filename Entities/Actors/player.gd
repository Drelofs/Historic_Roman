extends KinematicBody2D

onready var Character = $Aagje

var speed = 200
var step_size = speed
var player_position
var player_target
var conversation_partner = null


func _ready():
	player_position = position
	player_target = player_position
	
	if Global.active_scene.has_node("Floor"):
		Global.active_scene.get_node("Floor").connect( "input_event", self, "_on_Floor_input_event" )


func _on_Floor_input_event(_viewport, event, _shape_idx):
	if event.is_action_pressed("left_click") && !conversation_partner:
		player_target = get_global_mouse_position()
		var _character_scale_x = abs(Character.scale.x)
		Character.scale.x = _character_scale_x * sign( player_target.x - player_position.x )


func _physics_process(_delta):
	player_position = get_position()
	var _distance_x = player_target.x - player_position.x # Verschil op X-as
	var _distance_y = player_target.y - player_position.y # Verschil op Y-as
	var _distance = sqrt( pow( _distance_x, 2 ) + pow( _distance_y, 2 ) ) # Pythagoras voor ware afstand
	if _distance > 4 || _distance < -4:
		var _angle = asin( _distance_x / _distance ) # De hoek in radialen
		# Als de afstand kleiner is dan de stapgrootte, maak stapgrootte gelijk aan afstand
		step_size = speed if _distance > speed else _distance
		var _movement_on_x = step_size * sin(_angle)
		var _movement_on_y = step_size * cos(_angle) * sign(_distance_y)
		var _motion = Vector2( _movement_on_x, _movement_on_y ) # De afstand die elke frame wordt afgelegd
		move_and_slide(_motion)
		
		var _is_moving = step_size / speed
		Character.walking = _is_moving
	else:
		Character.walking = 0
	
	if conversation_partner:
		if Global.active_scene.has_node(conversation_partner.get_path()):
			Global.zoom_x = 0.8
			Global.zoom_y = 0.8
			var _x_between = ( position.x + conversation_partner.position.x ) / 2
			var _y_between = ( position.y + conversation_partner.position.y ) / 2 - 200
			Global.camera.position = Vector2( _x_between, _y_between )
			Global.textfield_visible( true )
		else:
			conversation_partner = null
			Global.textfield_visible( false )
			Global.clear()
	else:
		Global.camera.position = Vector2( 960, 540 )
		Global.zoom_x = 1
		Global.zoom_y = 1
		Global.textfield_visible( false )
		Global.clear()
func _input(event):
	if event.is_action_pressed("ui_down"):
		conversation_partner = null

