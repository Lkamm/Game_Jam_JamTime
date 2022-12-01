extends Node
var player = null
var Player = load("res://Player/Player.tscn")
var Ingredients = []
var day = 1
var score = 0
var lives = 5
var end = false

func _unhandled_input(_event):
	if Input.is_action_pressed("quit"):
		get_tree().quit()

func reset():
	score = 0
	day = 1
	lives = 5
	Ingredients = []
	end = false
	player = null
	Player = load("res://Player/Player.tscn")
	

func _ready():
	pass # Replace with function body.
	
func update_score(p):
	score += p

func _physics_process(delta):
	if lives <= 0 and end == false: 
		end = true
		var _scene = get_tree().change_scene("res://Menu/Death_Menu.tscn")
