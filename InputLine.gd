extends LineEdit


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	grab_focus()
	var Room = load("res://Room.gd")
	#var testRoom = Room.new("Foo", "Bar")

func _input(event):
	if event.is_action_pressed("ui_accept"):
		pass
