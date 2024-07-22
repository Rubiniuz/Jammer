extends Area2D
class_name RarityGenerator

var rarity = 0

@export var items = ["CopperCoils", "Gears", "Rubbers"]
@export var itemWeight = {
	0: 50,
	1: 35,
	2: 15
}

func randomRarityGenerator():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	
	var totalWeight = 0
	for weight in itemWeight.values():
		totalWeight += weight
	
	var randomNumber = rng.randi_range(1, totalWeight)
	
	var cumulativeWeight = 0
	
	for item in itemWeight.keys():
		cumulativeWeight += itemWeight[item]
		if randomNumber <= cumulativeWeight:
			print(itemWeight[item])
			print(item)
			return item

func _ready():
	var i = 0
	while i < 10:
		randomRarityGenerator()
		i += 1
