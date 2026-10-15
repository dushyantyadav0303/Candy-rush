extends Node2D

const SPEED = 60

var direction = 1

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var ray_castright: RayCast2D = $RayCastright
@onready var ray_castleft: RayCast2D = $RayCastleft

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if ray_castright.is_colliding():
		direction = -1
		animated_sprite.flip_h = false
	if ray_castleft.is_colliding():
		direction = 1
		animated_sprite.flip_h = true

	position.x += direction * SPEED * delta
	
	
	
