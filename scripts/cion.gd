extends Area2D
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

@onready var manager: Node = %manager
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _on_body_entered(_body: Node2D) -> void:
	manager.add_point()
	animation_player.play("pick up")






func _ready() -> void:
	randomize() 
	
	var random_type: int = randi_range(1, 8)
	var chosen_animation: String = "Toffee" + str(random_type)
	var total_frames: int = sprite.sprite_frames.get_frame_count(chosen_animation)
	sprite.frame = randi() % total_frames
	sprite.play(chosen_animation)
