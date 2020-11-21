extends Node

# Import classes
const Item = preload("res://Item.gd")
const Island = preload("res://island.gd")

var game:Island = Island.new()

func _init():
	match game.build_island():
		OK:
			print_debug("Island successfully built.")
			for R in game.island:
				print(game.island[R])
		_:
			print_debug("Building island failed.")
