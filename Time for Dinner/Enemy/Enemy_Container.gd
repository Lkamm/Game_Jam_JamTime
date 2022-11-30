extends Node2D

var Enemy = load("res://Enemy/Enemy_Glutton")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	if get_child_count() == 1:
		var enemy = Enemy.instance()
		enemy.position = Vector2(randf()*Global.VP.x, randf()*Global.VP.y)
		add_child(enemy)

