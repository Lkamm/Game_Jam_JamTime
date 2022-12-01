extends StaticBody2D

var damage = 10
var health = 100
var uses = 5

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func trap(body):
	if body.name != "Player":
		body.speed(0)
		body.hp(5)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	trap(body)
	$Timer.start()




func _on_Timer_timeout():
	pass
