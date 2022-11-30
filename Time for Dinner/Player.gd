extends KinematicBody2D

onready var ray = $RayCast
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _hit():
	if ray.is_colliding():
		var t = ray.get_collider()
		var p = ray.get_collision_point()
		var n = ray.get_collision_normal()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Collection_body_entered(body):
	if body.name.substr(0, 5) == "food":
		body.queue_free()
		Global.update_score(100)
		print(body)
		print(Global.score)
		
