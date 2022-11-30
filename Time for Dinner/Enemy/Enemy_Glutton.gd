extends KinematicBody2D

export var constraint_left = Vector2(0,0)
export var constraint_right = Vector2(100,0)
export var speed = 10
var dmg = 5
var health = 15
var defense = 5
var score = 5

func _physics_process(_delta):
	if not $Tween.is_active():
		var constraint = constraint_left
		$Sprite.flip_h = true
		if position != constraint_right:
			constraint = constraint_right
			$Sprite.flip_h = false
		$Tween.interpolate_property(self, "position", position, constraint, speed, Tween.TRANS_EXPO, Tween.EASE_IN)
		$Tween.start()
		
		
func hp(d):
	d -= defense
	if d <= 0:
		d = 1
	health -= d
	if health <= 0:
		queue_free()
		Global.update_score(100)


func _on_Area2D_body_entered(body):
	if body.name == "Player":
		body.do_damage(dmg)
