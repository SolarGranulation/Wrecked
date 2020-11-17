extends LineEdit


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	grab_focus()
	var tRoom = load("res://Room.gd")
	var testRoom = Room.new("Foo", "Bar")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
