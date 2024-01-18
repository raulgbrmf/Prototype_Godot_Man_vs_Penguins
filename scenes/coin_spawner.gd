extends Node2D
class_name Coin_Spawner

var coin = preload("res://scenes/coin.tscn")
var can_spawn : bool = true

signal increase_score

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


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
	$CollectedSound.play()
	increase_score.emit()
	
