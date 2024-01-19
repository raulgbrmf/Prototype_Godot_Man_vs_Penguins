extends Node2D

var start: bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	$UI.set_visible(false)
	$Floor.set_name("Floor")
	$CoinSpawners.increase_score_overall.connect(_on_score_increased)
	$ManSpawner.die_signal.connect(_on_player_die)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if start:
		$Enemy_Spawner.spawn(-1)

func _on_score_increased():
	$UI.increment_score()

func _on_player_die():
	$UI.set_score(0)
	$UI.update_best_score()
	$UI.update_score()
	$DeathTimer.set_one_shot(true)
	$DeathTimer.start()


func _on_death_timer_timeout():
	$ManSpawner.spawn()

func play():
	$UI.set_visible(true)
	$StartTimer.set_one_shot(true)
	$StartTimer.start()
	$ThemeSong.play()

func _on_start_timer_timeout():
	start = true
	$CoinSpawners.spawn()
	$ManSpawner.spawn()
