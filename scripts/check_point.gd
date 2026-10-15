extends Area2D
var Reached = false

func _on_body_entered(body: Node2D) -> void:
	if Reached or not body.is_in_group("player"):
		return
		
	Reached = true
	print("reached")
	body.respawn_position = global_position
