extends Area2D
class_name BagOfHolding

@onready var collision_shape_2d = $CollisionShape2D

@export var holdableValue : int = 5
@export var heldResources : Array[resource] = []
@export var currentValue : int = 0
@export var pickupRadius : float = 36

var inRange : Array[resource] = []

func _ready():
	collision_shape_2d.shape.radius = pickupRadius

func _physics_process(_delta): # always 60fps check
	# check input if so pickup first item in array
	if(Input.is_action_pressed("pickup")): # E
		_try_add_item()

func Deposit() -> Array[resource]:
	if(heldResources.size() > 0):
		return heldResources
	return []

func Reset():
	heldResources = []
	currentValue = 0

func _try_add_item():
	if(inRange.size() <= 0):
		return
	if(currentValue + inRange[0].value <= holdableValue):
		heldResources.push_back(inRange.pop_front())
		currentValue = currentValue + heldResources.back().pickup()
		GameManager.startTimer()
		print(currentValue)
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
