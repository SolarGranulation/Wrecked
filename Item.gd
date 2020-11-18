extends Node2D

class_name Item
# These should be the Values of a global Dictionary 
# taking ENUMs as the keys

var _detail:String
var _brief:String
var _regex:String # for keyword matching

func describe():
	return _brief

func detail():
	return _detail

func regex(command:String):
	pass

func _init(decorative_text: String):
	_brief = decorative_text
