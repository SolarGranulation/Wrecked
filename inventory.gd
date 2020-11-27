extends Node

# This will be a minimal class just to ensure matching
# inventory handling across all cases
class_name Inventory

enum {INV_OK,
INV_FULL,
INV_EMPTY,
INV_ITEM_IS_PRESENT,
INV_ITEM_NOT_PRESENT,
INV_TARGET_NOT_INV,
INV_OTHER_FAILURE,
INV_NOT_IMPLEMENTED}

# Members
var contents = [] # An array of Items by ENUM
var limit:int = INF

func add(item:int) -> int:
	return INV_NOT_IMPLEMENTED

func remove(item:int) -> int:
	if self.contents.has(item):
		self.contents.erase(item)
		return INV_OK
	return INV_ITEM_NOT_PRESENT


func send_to(target, item:int) -> int:
	if ! self.contents.has(item):
		return INV_ITEM_NOT_PRESENT
	if target.get_class() == self.get_class():
		var transfer = target.accept(item)
		if transfer == INV_OK:
			self.remove(item)
			return INV_OK
		else:
			return transfer
	else:
		if target.inventory.exists():
			print_debug("Please use send_to on inventory objects.")
			return send_to(target.inventory, item)
		else:
			return INV_TARGET_NOT_INV
	return INV_OTHER_FAILURE

func accept(item:int) -> int:
	return INV_NOT_IMPLEMENTED

func set_limit(new_limit:int):
	pass

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
