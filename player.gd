extends Node

class_name Castaway

# Include
const Inventory = preload("res://inventory.gd")

# Members
var location:int = 0 # island index
var inventory = Inventory.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
