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

func _init():
	var _err = _roomstream.open(_roomfile)
	
# I'd like to read these in
# from an xml file

# HERE ENDETH THE ROOMS
