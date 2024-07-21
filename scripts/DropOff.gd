extends Area2D
class_name DropOff

@onready var collider: CollisionShape2D = $CollisionShape2D
@onready var item_pickup: ItemPickup = $ItemPickup

var player : Player = null

func _ready():
	GameManager.dropOff = self
	item_pickup.DeHighlight()

func _physics_process(_delta): # always 60fps check
	# check input if so pickup first item in array
	if(Input.is_action_pressed("pickup") && player != null): # E
		GameManager.addResources()

func _on_body_entered(body: Node2D) -> void:
	if(body is Player):
		player = body
		item_pickup.Highlight()


func _on_body_exited(body: Node2D) -> void:
	if(body is Player):
		player = null
		item_pickup.DeHighlight()
