extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -480.0

var is_dead: bool = false
var is_frozen: bool = false

signal die_signal

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	set_name.call_deferred("Man")
	$Node2D/Death.emitting = false
	
func _physics_process(delta):
	if is_dead or is_frozen:
		return
	else:
		# Add the gravity.
		handle_gravity(delta)
		# Handle Jump.
		jump()
		# Get the input direction and handle the movement/deceleration.
		# As good practice, you should replace UI actions with custom gameplay actions.
		run()


func handle_gravity(delta):
	if not is_on_floor():
		velocity.y += gravity * delta

func jump():
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

func run():
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
		if direction == -1:
			$Sprite2D.set_flip_h(true)
		else:
			$Sprite2D.set_flip_h(false)
		$AnimationPlayer.play("running")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func die():
	is_dead = true
	$Death.play()
	$AnimationPlayer.play("die")

func spawn():
	freeze()
	$AnimationPlayer.play("spawn")

func freeze():
	is_frozen = true
	
func unfreeze():
	is_frozen = false

func bounce():
	velocity.y = -200


func _on_animation_player_animation_finished(anim_name):
	match anim_name:
		"spawn":
			is_dead = false
			unfreeze()
		"die":
			print("emit 1")
			die_signal.emit()
			queue_free()
