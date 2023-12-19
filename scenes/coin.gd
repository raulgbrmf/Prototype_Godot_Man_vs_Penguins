extends RigidBody2D

signal coin_collected

# Called when the node enters the scene tree for the first time.
func _ready():
	can_sleep = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
	

func change_scale(value: Vector2):
	$CollisionShape2D.scale = value
	$Sprite2D.scale = value
	$CollisionDetection.scale = value


func _on_collision_detection_body_entered(body):
	if body.is_in_group("player"):
		coin_collected.emit()
		queue_free()


