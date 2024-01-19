extends CharacterBody2D


var SPEED = 200.0
var DIRECTION = 1
var is_dead: bool = false

signal change_direction

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	set_name("Penguin")

func _physics_process(delta):
	if is_dead:
		return
	else:
		handle_gravity(delta)


func walk(direction, speed):
	if direction == 1:
		$Sprite2D.set_flip_h(true)
	velocity.x = direction * speed
	$AnimationPlayer.play("walking")
	move_and_slide()
	if is_on_wall():
		if get_last_slide_collision().get_collider().get_name() == "Floor":
			change_direction.emit()


func handle_gravity(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
		move_and_slide()
	elif is_on_floor():
		walk(DIRECTION,SPEED)


func _on_change_direction():
	DIRECTION *= -1
	if $Sprite2D.is_flipped_h():
		$Sprite2D.set_flip_h(false)
	else:
		$Sprite2D.set_flip_h(true)

func die():
	is_dead = true
	$AnimationPlayer.play("die")
	
	print("die")

func _on_danger_zone_body_entered(body):
	if "die" in body and body.name == "Man":
		body.die()

func _on_vulnerable_zone_body_entered(body):
	if body.name == "Man":
		die()
		body.bounce()
