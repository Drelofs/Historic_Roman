extends TextureRect

export var string = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.text = string
	$Timer.wait_time = 0.2 * string.length()
	$Timer.start()


func _on_Timer_timeout():
	queue_free()
