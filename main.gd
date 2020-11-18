extends Node

# Needed non-class files
const _roomfile = "res://roomsfile.ini"

# Import classes
const Item = preload("res://Item.gd")
const Way = preload("res://Way.gd")
const Room = preload("res://Room.gd")

# Variables of large scope
var _roomstream:XMLParser = XMLParser.new()
var island = {}

# THINGS BEGIN HERE
enum {BASKET, 
	TORCH, 
	RADIO, 
	BATTERY,
	OAR, 
	KNIFE}

var all_the_things = {
	BASKET:		Item.new("a tattered wickerwork basket"),
	TORCH:		Item.new("a scuffed torch"),
	RADIO:		Item.new("a robust radio handset"),
	BATTERY:	Item.new("an old fashioned battery"),
	OAR:		Item.new("a wooden oar")
	# More to add
	}
# HERE ENDETH THE THINGS

# ROOMS BEGIN HERE
# Which are all part of the island array
const ROOMS = "rooms"
const ROOM = "room"
const TITLE = "title"
const DESCRIPTION = "description"

func _init():
	var _elem:String
	var _err = _roomstream.open(_roomfile)
	
	# Need to design the loops/functions
	while _err == OK:
		_err = _roomstream.read()
		if _err != OK:
			return _err
		if _roomstream.get_node_type() == XMLParser.NODE_ELEMENT_END:
			continue
		_elem = _roomstream.get_node_name()
		if _elem == TITLE:
			print("Hi")
			_err = _roomstream.read()
			if _err != OK:
				return _err
			print(_roomstream.get_node_data())
			print("Bye")

# _title:String
# _descriptions = [] # An array, accessed using _current_state
# _current_state:int
# _ways = [] # An array of Way objects, linking rooms.
# _inventory = [] # An array of Items

# HERE ENDETH THE ROOMS
