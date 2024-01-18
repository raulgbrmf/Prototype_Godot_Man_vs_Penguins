extends Node2D

signal increase_score_overall

var spawners_list = []
var last_spawner = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	for spawner in get_children():
		if spawner is Coin_Spawner:
			spawners_list.append(spawner)
			spawner.increase_score.connect(_on_score_increased)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_score_increased():
	spawn()
	increase_score_overall.emit()

func spawn():
	var random_index = last_spawner
	if spawners_list.size() > 0:
		while random_index == last_spawner:
			random_index = randi() % spawners_list.size()
		spawners_list[random_index].spawn()
