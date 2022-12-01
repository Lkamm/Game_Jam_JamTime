extends Node2D

onready var pasta = load("res://Ingredients/Food_Sauce.tscn")
onready var sauce = load("res://Ingredients/Food_Sauce.tscn")
var Ingredients = get_node_or_null("res/Game/Ingredients_Container")

func _physics_process(delta):
	pass

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


