extends Node2D

var coin = preload("res://scenes/coin.tscn")
var can_spawn : bool = true

# Called when the node enters the scene tree for the first time.
func _ready():
	spawn()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func spawn():
	var coin_spawned = coin.instantiate()
	coin_spawned.position = $Spot.position
	coin_spawned.change_scale(Vector2(0.5,0.5))
	#shot.increase_score.connect(_on_increase_score)
	coin_spawned.coin_collected.connect(_on_coin_collected)
	add_child.call_deferred(coin_spawned)
	
func _on_coin_collected():
	spawn()
	$CollectedSound.play()
