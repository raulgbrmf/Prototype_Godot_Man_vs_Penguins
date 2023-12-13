extends CharacterBody2D


var SPEED = 200.0
var DIRECTION = -1

signal change_direction

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	handle_gravity(delta)
	walk(DIRECTION,SPEED)


func walk(direction, speed):
	velocity.x = direction * speed
	$AnimationPlayer.play("walking")
	move_and_slide()
	if is_on_wall():
		if get_last_slide_collision().get_collider().get_name() == "Floor":
			change_direction.emit()


func handle_gravity(delta):
	if not is_on_floor():
		velocity.y += gravity * delta


func _on_change_direction():
	DIRECTION *= -1
	if $Sprite2D.is_flipped_h():
		$Sprite2D.set_flip_h(false)
	else:
		$Sprite2D.set_flip_h(true)
