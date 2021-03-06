extends Node

class_name Room

const Inventory = preload("res://inventory.gd")
const Way = preload("res://Way.gd")
const BREAK = "\n"

#Class variables
var _title:String
var _descriptions = [] # An array, accessed using _current_state
var _current_state:int = 0
var _ways = [] # An array of Way objects, linking rooms.
var _inventory = Inventory.new()

# Rooms also have an id value - that is a
# int-type variant used as the key in
# the island dictionary

# Function to return the description, with appended
# Way and inventory Item decorative texts
func _to_string():
	var output:String = _title
	output += BREAK
	output += _descriptions[_current_state]
	for w in _ways:
		output += " "
		output += w.decor
	return output

# Increment through room states
func next_state():
	if ! set_state(_current_state + 1):
		_current_state = 0

func set_state(new_state:int) -> bool:
	if _descriptions.size() <= new_state:
		return false
	# Implicit else
	_current_state = new_state
	return true

# Add another descriptive state
func add_description(description:String):
	_descriptions.append(description)

# Adjacent rooms with a regex string to match 
# against player input.
func add_way(new_way:Way):
	_ways.append(new_way)

func put(): # Put Item in room inventory
	pass

func take(): # For taking Items from the room's
	# inventory. Syntax TBD
	pass

func _init(title:String):
	_title = title
