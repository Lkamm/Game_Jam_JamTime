extends Node
var player = null
var Player = load("res://Player/Player.tscn")
var ingredients = []
var day = 1
var score = 0
func _unhandled_input(_event):
	if Input.is_action_pressed("quit"):
		get_tree().quit()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func update_score(p):
	p += score

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
