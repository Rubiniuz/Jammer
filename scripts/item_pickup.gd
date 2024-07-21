extends Control
class_name ItemPickup

@onready var pickup_text = $PickupText

@export var item : resource = null
@export var text : String = "Press {input} to pickup {item}!"

# Called when the node enters the scene tree for the first time.
func _ready():
	if(item):
		pickup_text.text = text.format({"input": "E/Enter", "item" : item.id})
	else:
		pickup_text.text = text.format({"input": "E/Enter"})
	pickup_text.visible = false

func Highlight():
	pickup_text.visible = true
	
func DeHighlight():
	pickup_text.visible = false
