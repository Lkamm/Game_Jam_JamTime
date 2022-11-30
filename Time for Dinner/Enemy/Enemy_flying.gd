extends KinematicBody2D

onready var ray = $RayCast2D
export var speed = 115
export var dmg = 20
var health = 15
var defense = 5
var player = null
export var look_speed = 75
var line_of_sight = false
var Effects = null
var score = 10
var meatball = load("res://Weapons/MeatBall.tscn")
func _physics_process(_delta):
	if Global.player == null:
		Global.player = get_node_or_null("/root/Game/Player_Container/Player")
	if Global.player != null:
		ray.cast_to = ray.to_local(Global.player.global_position)
		var c = ray.get_collider()
		if c:
			var velocity = ray.cast_to.normalized()*look_speed
			if c.name == "Player":
				velocity = ray.cast_to.normalized()*speed
			move_and_slide(velocity, Vector2(0,0))
		Global.player = null

func _on_Area2D_body_entered(body):
	if body.name == "Player":
		body.do_damage(dmg)

func hp(d):
	d -= defense
	if d <= 0:
		d = 1
	health -= d
	if health <= 0:
		queue_free()
		Global.update_score(100)


func _on_Timer_timeout():
		Effects = get_node_or_null("/root/Game/Effects")
		var velocity = Vector2.ZERO
		var Meatball = meatball.instance()
		if player != null and Effects != null:
			ray.cast_to = ray.to_local(player.global_position)
			var s = ray.cast_to
			var c = ray.get_collision_point()
			var d = global_position.angle_to_point(s) - PI/2
			Meatball.rotation = d
			Meatball.global_position = d + c.rotated(d)
			Effects.add_child(Meatball)
		print(Meatball)
