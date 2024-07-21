extends Control
class_name BagInterface

@onready var bags : Array[Node] = get_node("%GridContainer").get_children()
var baguis : Array[BagItem] = []
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for bag in bags:
		baguis.push_back(bag)

func AddItem(item : resource):
	var valueCount := 0
	for bag in baguis:
		if(bag.isFilled):
			continue
		if(valueCount < item.value):
			bag.SetItem(item.sprite.texture)
			valueCount = valueCount + 1

func Clear():
	for bag in baguis:
		bag.Clear()
