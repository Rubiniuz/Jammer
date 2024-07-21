extends CharacterBody2D
class_name Player

# components
@onready var bag = %BagOfHolding

# nodes

# variables
@export var move_speed : float = 100

func _physics_process(delta):
	#get input direction
	var input_direction = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up")
	)
	
	#update velocity
	velocity = input_direction * move_speed * delta
	
	#move and slide function uses velocity of character body to move character on map
	move_and_slide()
