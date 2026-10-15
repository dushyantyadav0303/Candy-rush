extends Node2D

const SPEED = 190
var chase := false
var direction = 1

func _ready():
	add_to_group("chaser")

func _process(delta):
	if chase:
		position.x += direction * SPEED * delta

func finish() -> void:
	chase = false
