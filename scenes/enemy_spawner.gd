extends Node2D

@export var spawn_interval: float

var enemy = preload("res://scenes/penguin.tscn")
var can_spawn: bool = true
var direction = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	spawn(direction)

func spawn(direct):
	if can_spawn:
		print(direct)
		var enemy_spawned = enemy.instantiate()
		enemy_spawned.position = $Spot.position
		if "DIRECTION" in enemy_spawned:
			enemy_spawned.DIRECTION = direct
		enemy_spawned.scale = Vector2(0.2,0.2)
		add_child(enemy_spawned)
		$Timer.wait_time = spawn_interval
		$Timer.start()
		can_spawn = false
		

func _on_timer_timeout():
	can_spawn = true
	direction = direction * -1
