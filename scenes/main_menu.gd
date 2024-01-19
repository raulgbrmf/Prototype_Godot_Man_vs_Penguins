extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$CanvasLayer/AnimationPlayer.play("float_subtitle")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func slide_menu():
	$CanvasLayer/AnimationPlayer.play("slide_menu")
