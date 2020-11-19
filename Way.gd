extends Node2D

class_name Way

const Item = preload("res://Item.gd")

var destination # A Room's dictionary key.
# Otherwise things will go wrong.
var regex:String # A regular expression
# which, when matched to the player's 
# input, will catch attempts to move
var key # An item needed for passage
var decor:String # A decorative string to
# append to a room's description, 
# cuing the user.

func change_destination(d:String):
	destination = d

func change_key(k):
	key = k

func _init(_destination: String, _regex: String, _key, _decotext :String):
	destination = _destination
	regex = _regex
	key = _key
	decor = _decotext
