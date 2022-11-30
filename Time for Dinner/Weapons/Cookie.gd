extends Area2D

var damage = 5

onready var timer = $Timer



func _ready():
	pass


func _on_Cookie_body_entered(body):
	if  body.has_method("hp"):
		body.hp(damage)
		queue_free()


func _on_Timer_timeout():
	queue_free()
