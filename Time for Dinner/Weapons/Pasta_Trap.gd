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
#	body.speed(5)
	uses = uses -1
func _on_Area2D_body_entered(body):
	if uses != 0:
		trap(body)
		$Timer.start()
	pass



func _on_Timer_timeout():
	pass
