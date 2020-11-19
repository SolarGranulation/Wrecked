extends Node2D

class_name Room

const Item = preload("res://Item.gd")
const Way = preload("res://Way.gd")

#Class variables
var _title:String
var _descriptions = [] # An array, accessed using _current_state
var _current_state:int = 0
var _ways = [] # An array of Way objects, linking rooms.
var _inventory = [] # An array of Items
# Rooms also have an id value - that is a
# String-type variant used as the key in
# the island dictionary

# Function to return the description, with appended
# Way and inventory Item decorative texts
func describe():
	return _descriptions[_current_state]

# Increment through room states
func next_state():
	_current_state += 1
	if _current_state >= _descriptions.size():
		_current_state = 0

# Add another descriptive state
func add_description(description:String):
	_descriptions.append(description)

# Adjacent rooms with a regex string to match 
# against player input.
func add_way(new_way:Way):
	_ways.append(new_way)

func put(thing:Item): # Put Item in room inventory
	pass

func take(): # For taking Items from the room's
	# inventory. Syntax TBD
	pass

func _init(title:String):
	_title = title
