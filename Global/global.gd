extends Node

onready var Player = preload( "res://Entities/Actors/player.tscn" )
onready var ActionTree = preload("res://Interfaces/ActionTree/actiontree.tscn")
onready var transition = $TransitionScreen/CanvasLayer/ColorRect/AnimationPlayer
var active_scene = null
var active_player = null
var active_actiontree = null


func _ready():
	var root = get_tree().get_root()
	active_scene = root.get_child( root.get_child_count() - 1 )
	
	transition.set_current_animation('Fade')


# Laad de gewenste scene met de speler
# Parameters: Gewenste scene, of de speler overgeplaatst moet worden, [X & Y waarde van overgeplaatste speler] (optioneel)
func go_to_level( path, with_player, player_x = 0, player_y = 0 ):
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








