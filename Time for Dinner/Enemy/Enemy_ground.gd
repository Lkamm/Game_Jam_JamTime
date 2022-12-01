extends KinematicBody2D

export var constraint_left = Vector2(0,0)
export var constraint_right = Vector2(100,0)
export var speed = 10
var dmg = 5
var health = 15
var defense = 5
var score = 5
var direction = 1
var sauce = load("res://Ingredients/Food_Sauce.tscn")
onready var Meatball = load("res://Weapons/MeatBall.tscn")



func _physics_process(_delta):
	if not $Tween.is_active():
		$Sprite.play()
		var constraint = constraint_left
		$Sprite.flip_h = false
		direction = -1
		if position != constraint_right:
			constraint = constraint_right
			$Sprite.flip_h = true
			direction = 1
		$Tween.interpolate_property(self, "position", position, constraint, speed, Tween.TRANS_EXPO, Tween.EASE_IN)
		$Tween.start()
		
		
func hp(d):
	d -= defense
	if d <= 0:
		d = 1
	health -= d
	if health <= 0:
		queue_free()
		var Sauce = sauce.instance()
		Sauce.global_position = global_position
		Global.update_score(100)		


func _on_Area2D_body_entered(body):
	if body.name == "Player":
		body.do_damage(dmg)


func _on_Timer_timeout():
	var Weapon_Container = get_node_or_null("/root/Game/Weapon_Container")
	if Weapon_Container != null:
		var meatball = Meatball.instance()
		meatball.position = position + Vector2(45,0)
		if direction < 0:
			meatball.velocity.x *= -1
		Weapon_Container.add_child(meatball)
