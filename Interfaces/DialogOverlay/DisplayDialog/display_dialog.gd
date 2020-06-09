extends TextureRect

export var speaker = ""
export var string = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.text = speaker + ": " + string
