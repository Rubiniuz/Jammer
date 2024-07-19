extends Node

# Editor references
@onready var timer: Timer = %Timer
@onready var timer_status: TextureProgressBar = %TimerStatus

# File references
@export var startScene : PackedScene = null
@export var gameScene : PackedScene = null

# Variables
@export var gatherTime : float = 60.0

# Components
#@export var inventory : Inventory = null
# bag or player ref
#@export var bag : Bag = null # holding system from beginning of the game
#@export var player : Player = null

func _ready() -> void:
	print("GameManager Init!")
	timer.wait_time = gatherTime
	timer_status.max_value = gatherTime
	
	get_tree().change_scene(startScene)
	print("GameManager Started!")
	# to get this manager use $"/root/GameManager"

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
