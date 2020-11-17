extends Node2D

class_name Way

const Item = preload("res://Item.gd")

var destination # A Room object. Otherwise things
# will go wrong.
var regex:String # A regular expression
# which, when matched to the player's 
# input, will catch attempts to move
var key:Item # An item needed for passage
var decor:String # A decorative string to
# append to a room's description, 
# cuing the user.

func _init():
	pass
