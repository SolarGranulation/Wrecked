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

func build_room(_stream:XMLParser):
	var new_room:Room # Constructor takes title and description 0
	var _title
	var _description # Description 0
	var _additional_descriptions = []
	# Read the next line, controlling a while loop
		# Check node type:
		# If it's an element END:
			# If it's /room:
				#return
			#otherwise:
				#continue
		# If it's an element: 
		# Check element name:
			# If title:
				# Advance to next (text) element
				# set _title
			# If first description:
				# Advance to next (text) element
				# set _description
			# If another description:
				# Advance to next (text) element
				# append to _additional_descriptions
	######## This could be better. What if unexpected EOF? ########

func _init():
	var _elem:String
	var _err = _roomstream.open(_roomfile)
	
	# Need to design the loops/functions
	while _roomstream.read() == OK:
		var _type = _roomstream.get_node_type() 
		if _type == XMLParser.NODE_ELEMENT_END:
			continue # If it's a closing tag, iterate
		if _type == XMLParser.NODE_ELEMENT:
			_elem = _roomstream.get_node_name()
			if _elem == ROOM:
				build_room(_roomstream)
#			if _elem == TITLE:
#				_err = _roomstream.read()
#				if _err != OK:
#					return _err
#				if _roomstream.get_node_type() == XMLParser.NODE_TEXT:
#					print(_roomstream.get_node_data())
	return _err # _init()


# HERE ENDETH THE ROOMS
