extends Node

# Import classes
const Item = preload("res://Item.gd")
const Way = preload("res://Way.gd")
const Room = preload("res://Room.gd")

# THINGS BEGIN HERE
enum {BASKET, 
	TORCH, 
	RADIO, 
	BATTERY,
	OAR, 
	KNIFE}

var all_the_things = {
	BASKET: Item.new("a tattered wickerwork basket"),
	TORCH: Item.new("a scuffed torch")}
	# More to add
# HERE ENDETH THE THINGS

# BEGINNING OF ROOMS



# HERE ENDETH THE ROOMS
