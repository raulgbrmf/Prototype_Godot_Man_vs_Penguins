extends Node2D
class_name ManSpawner

var man = preload("res://scenes/man.tscn")
var can_spawn : bool = true

signal die_signal

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func spawn():
	var man_spawned = man.instantiate()
	man_spawned.position = $Spot.position
	man_spawned.die_signal.connect(_on_player_die)
	add_child.call_deferred(man_spawned)

func _on_player_die():
	print("emit 2")
	die_signal.emit()
