extends AnimatableBody2D

@export var sink_speed: float = 55
@export var rise_speed: float = 60.0  
@export var max_sink_distance: float = 150 

var start_position: Vector2
var bodies_on_platform: int = 0

@onready var detect: Area2D = $DetectArea



func _ready() -> void:
	start_position = global_position

	if not detect.body_entered.is_connected(_on_detect_area_body_entered):
		detect.body_entered.connect(_on_detect_area_body_entered)
	if not detect.body_exited.is_connected(_on_detect_area_body_exited):
		detect.body_exited.connect(_on_detect_area_body_exited)


func _physics_process(delta: float) -> void:
	var target_y: float
	var speed: float



	if bodies_on_platform > 0:
		target_y = start_position.y + max_sink_distance
		speed = sink_speed
	else:
		target_y = start_position.y
		speed = rise_speed


	global_position.y = move_toward(global_position.y, target_y, speed * delta)


func _on_detect_area_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		bodies_on_platform += 1


func _on_detect_area_body_exited(body: Node2D) -> void:
	if body is CharacterBody2D:
		bodies_on_platform -= 1
