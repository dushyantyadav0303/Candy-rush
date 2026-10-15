extends Area2D

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var label: Label = $CanvasLayer/Label
@export var player: CharacterBody2D
var triggered := false

func _on_ready() -> void:
	if not body_entered.is_connected(_on_body_entered):
		body_entered.connect(_on_body_entered)
	label.hide()

func _on_body_entered(_body: Node2D) -> void:
	triggered = true
	_run_sequence(_body) 

func _run_sequence(player: Node2D) -> void:
	if not player.is_in_group("player"):
		return
	player.move = false
	label.show()
	label.text = "This is the end level!\nRun and grab the candy!"
	await get_tree().create_timer(2.0).timeout

	label.text = "3"
	await get_tree().create_timer(1.0).timeout
	label.text = "2"
	await get_tree().create_timer(1.0).timeout
	label.text = "1"
	await get_tree().create_timer(1.0).timeout

	label.text = "GO!"
	player.move = true
	animated_sprite.play("gate")
	var ghost = get_tree().get_first_node_in_group("chaser")
	if ghost:
		ghost.chase = true
	await get_tree().create_timer(0.5).timeout
	label.hide()
