extends Node

var suppliesArray = [-1, -1, 0, 1, 1.5]
var supplies = 0

class SupplyStrategy:
	func update_supplies(supplies_array: Array) -> int:
		return 0

class AddSupplies extends SupplyStrategy:
	func update_supplies(supplies_array: Array) -> int:
		var total = 0
		for item in supplies_array:
			if item > 0:
				total += item
		return total

class SubtractSupplies extends SupplyStrategy:
	func update_supplies(supplies_array: Array) -> int:
		var total = 0
		for item in supplies_array:
			if item < 0:
				total += item
		return total

class SuppliesCalculator:
	var strategy: SupplyStrategy

	func _init(strategy: SupplyStrategy):
		self.strategy = strategy

	func set_strategy(new_strategy: SupplyStrategy):
		self.strategy = new_strategy

	func calculate_supplies(supplies_array: Array) -> int:
		if strategy != null:
			return strategy.update_supplies(supplies_array)
		return 0

func _ready():
	var supplies_array = [10, -5, 15, -3]

	var calculator = SuppliesCalculator.new(AddSupplies.new())
	var added_supplies = calculator.calculate_supplies(supplies_array)
	print("Total added supplies: %d" % added_supplies)

	calculator.set_strategy(SubtractSupplies.new())
	var subtracted_supplies = calculator.calculate_supplies(supplies_array)
	print("Total subtracted supplies: %d" % subtracted_supplies)
