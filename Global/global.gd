extends Node

onready var Player = preload( "res://Entities/Actors/player.tscn" )
onready var ActionTree = preload("res://Interfaces/ActionTree/actiontree.tscn")
onready var Inventory = preload("res://Interfaces/Inventory/inventory_interface.tscn")
onready var transition = $TransitionScreen/CanvasLayer/ColorRect/AnimationPlayer
onready var camera = $Camera2D
onready var API = $HTTPRequest
var url = "http://134.122.53.241:5005/webhooks/rest/webhook"
var active_scene = null
var active_player = null
var active_actiontree = null
var active_inventory = null
var zoom_x = 1
var zoom_y = 1
var zoom_speed = 10
var session_id
var break_convo = false # wordt gebruitk voor breken van convo mode

func _ready():
	var root = get_tree().get_root()
	active_scene = root.get_child( root.get_child_count() - 1 )
	_generate_id()
	print(session_id)

func _process(delta):
	camera.zoom.x += ( zoom_x - camera.zoom.x ) / zoom_speed;
	camera.zoom.y += ( zoom_y - camera.zoom.y ) / zoom_speed;

func _generate_id():
	var chars = "abcdefghijklmnopqrstuvwxyz!@#1234567890";
	var o = []
	var rng = RandomNumberGenerator.new()
	for ss in chars:
		o.append(ss);
		chars = ""
	for x in range(10):
		rng.randomize()
		chars += o[rng.randf_range(0, o.size())]
	session_id = chars


# Stuur string naar chat API
# Parameters: tekst
func send_to_api( string ):
	var data = {"sender": session_id, "message": string}
	var query = JSON.print(data)
	var headers = ["Content-Type: application/json"]
	API.request( url, headers, true, HTTPClient.METHOD_POST, query)

func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	if response_code == 200:
		var response = parse_json(body.get_string_from_utf8())
		print(response)
		if active_player.conversation_partner:
			for x in range(response.size()):
				if !check_special_actions(response[x]["text"]):
					show_dialog(response[x]["text"], active_player.conversation_partner.npc_name)
					yield(get_tree().create_timer(4), "timeout")
			if break_convo:
				active_player.conversation_partner = null
				break_convo = false
func check_special_actions(string):
	if "[BREAK]" in string:
		print("stop interactie")
		break_convo = true
		return true
	elif "[CLEAR]" in string:
		print("clear objective")
		return true
	elif "[QUEST]" in string:
		print("start objective")
		break_convo = true
		return true
	else: 
		return false
# Laad de gewenste scene met de speler
# Parameters: Gewenste scene, of de speler overgeplaatst moet worden, [X & Y waarde van overgeplaatste speler] (optioneel)
func go_to_level( path, with_player, player_x = 0, player_y = 0 ):
	transition.play_backwards("Fade")
	yield(transition, "animation_finished")
	call_deferred( "_deferred_goto_scene", path, with_player, player_x, player_y )

func _deferred_goto_scene( path, with_player, player_x = 0, player_y = 0 ): 
	remove_player()
	remove_actiontree()
	active_scene.free()
	var _scene = ResourceLoader.load(path)
	active_scene = _scene.instance()
	get_tree().get_root().add_child(active_scene)
	get_tree().set_current_scene(active_scene) #API
	if with_player == true:
		spawn_player( player_x, player_y )
		spawn_actiontree()
		spawn_inventory()
	transition.play('Fade')


# Spawn de speler op genoemde locatie (alleen als speler niet al bestaat)
# Parameters: X van speler, Y van speler
func spawn_player( x, y ) -> void:
	if active_player == null: 
		active_player = Player.instance()
		var position = Vector2( x, y )
		active_player.set_position( position )
		active_player.player_target = active_player.position
		active_scene.add_child( active_player )
		active_player.set_owner( active_scene )
	

# Spawnt actiontree wanneer deze niet bestaat
# Parameters: geen
func spawn_actiontree() -> void:
	if active_actiontree == null:
		active_actiontree = ActionTree.instance()
		active_scene.add_child( active_actiontree )
		active_actiontree.set_owner( active_scene )
func spawn_inventory() -> void:
	if(active_inventory == null):
		active_inventory = Inventory.instance()
		active_scene.add_child(active_inventory)
		active_inventory.set_owner(active_scene)
# Verwijdert de speler (wanneer deze bestaat)
# Parameters: geen
func remove_player() -> void:
	if !active_player == null:
		active_player.queue_free();
		active_player = null


# Verwijdert de actiontree (wanneer deze bestaat)
# Parameters: geen
func remove_actiontree() -> void:
	if !active_actiontree == null:
		active_actiontree.queue_free();
		active_actiontree = null


# Toont het scherm
# Parameters: geen
func visible( _visible ):
	if( _visible ):
		transition.play('Fade')
	else:
		transition.play_backwards('Fade')


# Pusht tekst naar je scherm
func show_text( string ):
	$DialogOverlay.show_text( string )


# Pusht dialoog tekst naar je scherm
func show_dialog( string, speaker ):
	$DialogOverlay.show_dialog( string, speaker )

# Zet input aan of uit
func textfield_visible( visible ):
	$DialogOverlay.textfield_visible = visible

func clear():
	$DialogOverlay.clear()













