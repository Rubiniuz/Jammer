extends Area2D
class_name resource

# nodes
@onready var sprite: Sprite2D = %Sprite
@onready var pickup_sound: AudioStreamPlayer2D = %PickupSound
@onready var timer: Timer = %Timer

@onready var collider: CollisionShape2D = %Collider

@onready var item_pickup: ItemPickup = %ItemPickup

# variables
@export_range(1,5) var value : int = 1
@export var id : String = ""
@export var description : String = ""

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# call this generic function when you grab an item
func pickup() -> int:
	collider.disabled = true
	sprite.visible = false
	pickup_sound.play()
	dehighlight()
	# timer.start() # Actually kill object. this creates a bug needs a rework of data structures (1 game object connected to a non freeable structure)
	return value

func highlight():
	item_pickup.Highlight()

func dehighlight():
	item_pickup.DeHighlight()

func clear():
	queue_free()
