extends KinematicBody2D

onready var SM = $StateMachine

var health = 35
var defense = 10
var velocity = Vector2.ZERO
var jump_power = Vector2.ZERO
var direction = 1
var isAttacking = false
var damage = 25
onready var Cookie = preload("res://Weapons/Cookie.tscn")

onready var Ingredients = []
export var gravity = Vector2(0,30)

export var move_speed = 35
export var max_move = 220

export var jump_speed = 170
export var max_jump = 1400

export var leap_speed = 170
export var max_leap = 1400

var moving = false
var is_jumping = false
var double_jumped = false
var should_direction_flip = true # wether or not player controls (left/right) can flip the player sprite

func _physics_process(_delta):
	velocity.x = clamp(velocity.x,-max_move,max_move)
	Global.health = health
		
	if should_direction_flip:
		if direction < 0 and not $AnimatedSprite.flip_h: $AnimatedSprite.flip_h = true
		if direction > 0 and $AnimatedSprite.flip_h: $AnimatedSprite.flip_h = false
	
	if is_on_floor():
		double_jumped = false
		set_wall_raycasts(true)
		
	if Input.is_action_pressed("attack"):
		$AnimatedSprite.play("Attacking")
		$AudioStreamPlayer2D.play()
		isAttacking = true
		
	if Input.is_action_just_pressed("attack"):
		$AnimatedSprite.play("Attacking")
		isAttacking = true
		if direction == 1:
			$AttackArea/CollisionShape2D.disabled = false
		if direction == -1:
			$AttackAreaR/CollisionShape2D.disabled = false
			


func is_moving():
	if Input.is_action_pressed("left") or Input.is_action_pressed("right"):
		return true
	return false

func move_vector():
	return Vector2(Input.get_action_strength("right") - Input.get_action_strength("left"),1.0)

func _unhandled_input(event):
	if event.is_action_pressed("left"):
		direction = -1
		$AttackArea/CollisionShape2D.disabled = true
		$AttackAreaR/CollisionShape2D.disabled = true
	if event.is_action_pressed("right"):
		direction = 1
		$AttackArea/CollisionShape2D.disabled = true
		$AttackAreaR/CollisionShape2D.disabled = true
	if event.is_action_pressed("jump"):
		$AttackArea/CollisionShape2D.disabled = true
		$AttackAreaR/CollisionShape2D.disabled = true
	if event.is_action_pressed("shoot"):
		shoot()

func shoot():
	var Weapon_Container = get_node_or_null("/root/Game/Weapon_Container")
	if Weapon_Container != null:
		var cookie = Cookie.instance()
		cookie.position = position
		if direction < 0:
			cookie.velocity.x *= -1
		Weapon_Container.add_child(cookie)

	



func set_animation(anim):
	if $AnimatedSprite.animation == anim: return
	if $AnimatedSprite.frames.has_animation(anim): $AnimatedSprite.play(anim)
	else: $AnimatedSprite.play()

func is_on_floor():
	var fl = $Floor.get_children()
	for f in fl:
		if f.is_colliding():
			return true
	return false

func is_on_right_wall():
	if $Wall/Right.is_colliding():
		return true
	return false

func is_on_left_wall():
	if $Wall/Right.is_colliding():
		return true
	return false

func get_right_collider():
	return $Wall/Right.get_collider()

func get_left_collider():
	return $Wall/Left.get_collider()
	
func set_wall_raycasts(is_enabled):
	$Wall/Left.enabled = is_enabled
	$Wall/Right.enabled = is_enabled

func do_damage(d):
	d -= defense
	if d <= 0:
		d = 1
	health -= d
	if health <= 0:
		Global.lives -= 1
		Global.player = null
		queue_free()

func die():
	Global.lives -= 1
	Global.player = null
	queue_free()


func _on_AnimatedSprite_animation_finished():
	if "Attack" in $AnimatedSprite.get_animation():
		$AttackArea/CollisionShape2D.disabled = true
		$AttackAreaR/CollisionShape2D.disabled = true
		$AnimatedSprite.play("Idle")
		isAttacking = false
	else: 
		$AttackArea/CollisionShape2D.disabled = true
		$AttackAreaR/CollisionShape2D.disabled = true
		$AnimatedSprite.play("Idle")
		isAttacking = false
		

	


func _on_AttackArea_body_entered(body):
	if body.has_method("hp"):
		body.hp(damage)
		
			


func _on_AttackAreaR_body_entered(body):
	if body.has_method("hp"):
		body.hp(damage)

	


#func _on_Food_Collection_body_entered(body):
	#if body.name.substr(0, 4) == "Food":
		#body.queue_free()
		#Global.update_score(100)
		#Global.Ingredients.append(body.name)
		#print(body.name)
		#print(Ingredients)
		#print(Ingredients)


func _on_Area2D_body_entered(body):
	if body.name.substr(0,4) == "Food":
		body.queue_free()
		Global.Ingredients.append(body.food)
		print(Global.Ingredients)
