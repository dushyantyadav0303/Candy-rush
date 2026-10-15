extends Area2D
@onready var label: Label = $"../CanvasLayer/Label"


func _on_body_entered(body: Node2D) -> void:
	if not body.is_in_group("player"):
		return
	var ghost = get_tree().get_first_node_in_group("chaser")
	if ghost:
		ghost.finish()
		print("finish")
		label.show()
		label.text = "Congrats! you did it \n enjoy the Halloween party \n ~ Dushyant Yadav \n Phantom hackClub "
		body.move = false 
