extends Node2D

var menu_visible: bool = true
var game_started: bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	start()

func start():
	if Input.is_action_just_pressed("start") and menu_visible:
		menu_visible = false
		$MainMenu.slide_menu()
		$MainStage.play()
