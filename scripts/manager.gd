extends Node
var score = 0
@onready var label: Label = %Label

func add_point():
	score += 1
	label.text = " Toffee: "  + str(score)
