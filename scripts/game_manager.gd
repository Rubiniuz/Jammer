extends Node
# to get this manager use $"/root/GameManager"

# Editor references
@onready var timer: Timer = %Timer
@onready var timer_interface: Control = %Player.get_node("%TimerInterface")
@onready var bag: BagOfHolding = %Player.get_node("%BagOfHolding")
@onready var timer_status: TextureProgressBar = timer_interface.get_node("%TimerStatus")

# File references
@export var startScene : PackedScene = null
@export var gameScene : PackedScene = null

# Variables
@export var gatherTime : int = 60
@export var storedResources : Array[resource] = []

# Components
@export var dropOff : DropOff = null : set = setDropOff

func _ready() -> void:
	print("GameManager Init!")
	timer.wait_time = gatherTime
	
	#get_tree().change_scene(startScene)
	print("GameManager Started!")

func _process(_delta: float) -> void:
	if timer.time_left > 0:
		timer_status.value = gatherTime - timer.time_left

func startTimer():
	if(timer.time_left > 0):
		return
	timer.start()

func enterGame():
	# Handle final inventory requirements
	# Play transition
	# Change Game manager functionality - bool?
	pass
	#get_tree().change_scene(gameScene)

func setDropOff(node:DropOff):
	if(node is DropOff):
		dropOff = node

func addResources():
	if(bag.heldResources.size() > 0):
		print(bag.heldResources)
		storedResources.append_array(bag.heldResources)
		print(storedResources.size())
		bag.Reset()
