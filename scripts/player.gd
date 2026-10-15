extends CharacterBody2D

const SPEED = 200.0
const JUMP_VELOCITY = -350.0
var move := true 

@onready var animated_sprite = $AnimatedSprite2D


func _ready() -> void:
	add_to_group("player")
	
func _physics_process(delta: float) -> void:
	# Apply gravity when in the air
	if not is_on_floor():
		velocity += get_gravity() * delta


	if not move:
		velocity.x = 0
		if is_on_floor():
			animated_sprite.play("idel")
		move_and_slide()
		return

	# Jump
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	#get the input direction: -1, 0, 1

	# Horizontal movement
	var direction := Input.get_axis("move-left", "move_right ")
	
	#flip the sprite
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("idel")
		else:
			animated_sprite.play("walk")
	else:
		animated_sprite.play("jump")
	if direction > 0:
		animated_sprite.flip_h = false 
	elif direction < 0:
		animated_sprite.flip_h = true 
	# play animation
	
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
