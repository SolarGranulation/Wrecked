extends Node

# Needed non-class files
const _roomfile = "res://roomsfile.ini"

# Import classes
const Item = preload("res://Item.gd")
const Way = preload("res://Way.gd")
const Room = preload("res://Room.gd")

# Variables of large scope
var roomstream:XMLParser = XMLParser.new()
var island = {}
var rooms_done = false

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

# LET'S BUILD AN ISLAND! 
const ISLAND = "island"
const ROOMS = "rooms"
const ROOM = "room"
const ROOM_TITLE = "title"
const ROOM_DESCRIPTION = "description"
const WAYS = "ways"
const WAY = "way"
const WAY_ORIGIN = "origin"
const WAY_DESTINATION = "destination"
const WAY_REGEX = "regex"
const WAY_KEY = "key"
const WAY_DECOR = "decor"

func extract_text(_stream:XMLParser) -> String:
	if _stream.read() != OK:
		return ""
	# Check that it's text
	if _stream.get_node_type() != XMLParser.NODE_TEXT:
		return ""
	return _stream.get_node_data()
		
func build_room(_stream:XMLParser):
	var new_room:Room # Constructor takes title and description 0
	var _title
	var _descriptions = []
	
	# Read the next line, controlling a while loop
	while _stream.read() == OK:
		# Check node type:
		var _type = _stream.get_node_type()
		# If it's an element END:
		if _type == XMLParser.NODE_ELEMENT_END:
			# and it's /room, break out of loop:
			if _stream.get_node_name() == ROOM:
				break
			# otherwise continue:
			continue # end-if of NODE_ELEMENT_END
		# If it's an element: 
		if _type == XMLParser.NODE_ELEMENT:
			# Check element name:
			var _elem = _stream.get_node_name()
			# If title:
			if _elem == ROOM_TITLE:
				# set _title
				_title = extract_text(_stream)
			# If description:
			if _elem == ROOM_DESCRIPTION:
				# add _description
				_descriptions.append(extract_text(_stream))
	# END OF WHILE
	# New type check to catch errors
	if _stream.get_node_type() == XMLParser.NODE_NONE:
				return FAILED
	new_room = Room.new(_title)
	for d in _descriptions:
		new_room.add_description(d)
	return new_room # kind of important :P

func parse_rooms(_stream:XMLParser):
	while _stream.read() == OK:
		var _type = _stream.get_node_type()
		var _elem = _stream.get_node_name() 
		if _type == XMLParser.NODE_ELEMENT_END:
			if _elem == ROOMS: # If it's the end of the rooms
				return OK
			continue # If it's another closing tag, iterate
		if _type == XMLParser.NODE_ELEMENT:
			if _elem == ROOM: 
				var roomID = _stream.get_named_attribute_value_safe("id")
				var built_room = build_room(_stream)
				if typeof(built_room) != TYPE_OBJECT:
					return FAILED
				island[roomID] = built_room
	return FAILED # This should never happen

func make_way(_stream:XMLParser):
	pass

func parse_ways(_stream:XMLParser):
	while _stream.read() == OK:
		var _type = _stream.get_node_type()
		var _elem = _stream.get_node_name() 
		if _type == XMLParser.NODE_ELEMENT_END:
			if _elem == WAYS: # If it's the end of the rooms
				return OK
			continue # If it's another closing tag, iterate
		if _type == XMLParser.NODE_ELEMENT:
			if _elem == WAY: 
				var way_origin = _stream.get_named_attribute_value_safe(WAY_ORIGIN)
				var made_way = make_way(_stream)
				if typeof(made_way) != TYPE_OBJECT:
					return FAILED
				island[way_origin].add_way(made_way)
	return FAILED # This should never happen

func build_island():
	var _err = roomstream.open(_roomfile)
	var _ways_return = 0
	
	# Need to design the loops/functions
	while roomstream.read() == OK:
		var _type = roomstream.get_node_type()
		var _elem = roomstream.get_node_name() 
		if _type == XMLParser.NODE_ELEMENT_END:
			if _elem == ISLAND: # If it's the end of the island
				return OK
			continue # If it's another closing tag, iterate
		if _type == XMLParser.NODE_ELEMENT:
			if _elem == ROOMS: 
				if rooms_done:
					_err = roomstream.seek(_ways_return-1)
					if _err != OK:
						return _err
					continue
				_err = parse_rooms(roomstream)
				if _err == OK: # control for errors
					rooms_done = true # Must be before ways
					continue # Don't need the next statements
				else:
					break # Something wrong
			if _elem == WAYS:
				# Check that rooms are done
				if rooms_done: # parse ways
					_err = parse_ways(roomstream)
					if _err != OK: #control for errors
						break
				else: # if rooms are not done
					# Prepare to return to this point
					_ways_return = roomstream.get_node_offset()
	return _err

func _init():
	build_island() # _init() 
