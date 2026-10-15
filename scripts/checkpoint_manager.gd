extends Node2D

var last_loc: Vector2
@export var player: CharacterBody2D

func _ready() -> void:
	if player:
		last_loc = player.global_position 

func respawn_player() -> void:
	if player:
		# 1. Instantly stop all gravity and movement momentum
		player.velocity = Vector2.ZERO
		
		# 2. Teleport the player back to safety
		player.global_position = last_loc
		print("Player successfully moved to: ", last_loc)
