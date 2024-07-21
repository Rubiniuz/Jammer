extends Control
class_name BagItem

@onready var texture: TextureRect = %TextureRect

@export var isFilled := false

func SetItem(text : Texture):
	texture.texture = text
	isFilled = true

func Clear():
	texture.texture = null
	isFilled = false
