extends Node2D

class_name Room

const Item = preload("res://Item.gd")
const Way = preload("res://Way.gd")

#Class variables
var _title: String
var _description: String
var _ways = [] # An array of Way objects, linking rooms.
var _inventory = []

# Function to return the description, with appended
# Way and inventory Item decorative texts
func describe():
	pass

# Adjacent rooms with a regex string to match 
# against player input.
func add_way(new_way: Way):
	_ways.append(new_way)

func put(thing: Item): # Put Item in room inventory
	pass

func take(): # For taking Items from the room's
	# inventory. Syntax TBD
	pass

func _init(title: String, description:String):
	_title = title
	_description = description

