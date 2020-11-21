extends Node

# Import classes
const Island = preload("res://island.gd")

# Other constants
const LOOK = "look"

var game:Island = Island.new()
var player_location
var terminal:RichTextLabel 

func _command(input:String):
	if input.begins_with(LOOK):
		terminal.text += "\n\r" + game.island[player_location]._to_string() + "\n\r"
	

func _ready():
	terminal = get_node("/root/Control/PanelText/LayoutText/OutputRich")
	print(terminal.text)

func _init():
	match game.build_island():
		OK:
			print_debug("Island successfully built.")
			player_location = game.first_room
		_:
			print_debug("Building island failed.")
