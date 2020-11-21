extends Node

# Import classes
const Island = preload("res://island.gd")

# Other constants
const LOOK = "look"
const INPUT_EXIT = "exit"
const INPUT_QUIT = "quit"

var game:Island = Island.new()
var player_location
var terminal:RichTextLabel 

func _command(input:String):
	if input.begins_with(LOOK):
		terminal.text += "\n\r" + game.island[player_location]._to_string() + "\n\r"
		return
	if input.begins_with(INPUT_EXIT) || input.begins_with(INPUT_QUIT):
		get_tree().quit()
	else:
		for w in game.island[player_location]._ways:
			print("Checking the ways...")
			if w.regex.search(input):
				player_location = w.destination
				_command(LOOK)
				break

func _ready():
	terminal = get_node("/root/Control/PanelText/LayoutText/OutputRich")

func _init():
	match game.build_island():
		OK:
			print_debug("Island successfully built.")
			player_location = game.first_room
		_:
			print_debug("Building island failed.")
