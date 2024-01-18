extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	$Floor.set_name("Floor")
	$CoinSpawners.increase_score_overall.connect(_on_score_increased)
	$Man.die_signal.connect(_on_player_die)
	$CoinSpawners.spawn()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_score_increased():
	$UI.increment_score()

func _on_player_die():
	$UI.set_score(0)
	$UI.update_best_score()
	$UI.update_score()
	$DeathTimer.start()



func _on_death_timer_timeout():
	pass
