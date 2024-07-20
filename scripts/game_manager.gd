extends Node
# to get this manager use $"/root/GameManager"

# Editor references
@onready var timer: Timer = %Timer
@onready var timer_interface: Control = %Player.get_node("%TimerInterface")
@onready var timer_status: TextureProgressBar = timer_interface.get_node("%TimerStatus")

# File references
@export var startScene : PackedScene = null
@export var gameScene : PackedScene = null

# Variables
@export var gatherTime : int = 60

# Components
#@export var inventory : Inventory = null
# bag or player ref
#@export var bag : Bag = null # holding system from beginning of the game
#@export var player : Player = null

func _ready() -> void:
	print("GameManager Init!")
	timer.wait_time = gatherTime
	
	#get_tree().change_scene(startScene)
	startTimer()
	print("GameManager Started!")

func _process(_delta: float) -> void:
	if timer.time_left > 0:
		timer_status.value = gatherTime - timer.time_left

func startTimer():
	timer.start()

func enterGame():
	# Handle final inventory requirements
	# Play transition
	# Change Game manager functionality - bool?
	get_tree().change_scene(gameScene)
