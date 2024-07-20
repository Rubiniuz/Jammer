extends Control
class_name ItemPickup

@onready var pickup_text = $PickupText

@export var item : resource = null
@export var text : String = "Press {input} to pickup {item}!"

# Called when the node enters the scene tree for the first time.
func _ready():
	pickup_text.value = text.format({"input": "E", "item" : item.id})
	pickup_text.hidden = true

func Highlight():
	pickup_text.hidden = false
	
func DeHighlight():
	pickup_text.hidden = true
