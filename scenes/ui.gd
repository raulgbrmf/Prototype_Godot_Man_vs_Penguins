extends CanvasLayer

var score: int = 0
var best_score: int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$BestScore.text = "Best: " + str(best_score)
	$Score.text = "Score: " + str(score)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func get_score():
	return score

func set_score(value):
	score = value
	if value > best_score:
		set_best_score(value)
	
func get_best_score():
	return best_score
	
func set_best_score(value):
	best_score = value

func increment_score():
	var current_score = get_score()
	set_score(current_score + 1)
	update_score()

func update_best_score():
	$BestScore.text = "Best:" + str(best_score)

func update_score():
	$Score.text = "Score: " + str(get_score())
	
