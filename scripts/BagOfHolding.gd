extends Area2D
class_name BagOfHolding

@export var holdableValue : int = 5
@export var heldResources : Array[resource] = []
@export var currentValue : int = 0

var inRange : Array[resource] = []

func _physics_process(delta): # always 60fps check
	# check input if so pickup first item in array
	if(Input.is_action_pressed("pickup")): # E
		_try_add_item()

func _try_add_item():
	if(inRange.size() <= 0):
		return
	if(currentValue + inRange[0].value < holdableValue):
		heldResources.push_back(inRange.pop_front())
		currentValue = currentValue + heldResources.back().pickup()
	else:
		# play animation on item
		return

func _on_area_entered(area): # setup collision and mask so that only items can be found
	var item : resource = area # cast to resource
	item.highlight()
	inRange.push_back(item)

func _on_area_exited(area):
	var item : resource = area # cast to resource
	var index : int = inRange.find(item)
	if(index > -1):
		item.dehighlight()
		inRange.remove_at(index)
