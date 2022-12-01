extends Area2D

var damage = 5
var velocity = Vector2(10,0)

onready var timer = $Timer



func _ready():
	pass

func _physics_process(_delta):
	position += velocity


func _on_Cookie_body_entered(body):
	if body.has_method("hp"):
		body.hp(damage)
		queue_free()


func _on_Timer_timeout():
	queue_free()
