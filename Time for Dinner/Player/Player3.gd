extends KinematicBody2D

onready var SM = $StateMachine

var health = 60
var defense = 25
var velocity = Vector2.ZERO
var jump_power = Vector2.ZERO
var direction = 1
var isAttacking = false
var damage = 20
var kill = 0
var dmg_r = false

export var gravity = Vector2(0,30)

export var move_speed = 15
export var max_move = 180

export var jump_speed = 120
export var max_jump = 500

export var leap_speed = 140
export var max_leap = 500

var moving = false
var is_jumping = false
var double_jumped = false
var should_direction_flip = true # wether or not player controls (left/right) can flip the player sprite


func _physics_process(_delta):
	velocity.x = clamp(velocity.x,-max_move,max_move)
		
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
	
	Global.playh = health
	
	if kill != Global.kill:
		if Global.Buff_1_1_K == true:
			health += .5
		if Global.Buff_1_2_K == true:
			damage += .25
		if Global.Buff_2_1_K == true:
			dmg_r = true
		if Global.Buff_2_2_K == true:
			move_speed += .5
			jump_speed += .5
			leap_speed += .5
		if Global.Buff_3_1_K == true:
			damage += (defense/8)
		if Global.Buff_3_2_K == true:
			defense += .75
		else: 
			defense += .5
		kill += 1
		


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
	if dmg_r == true:
		d -= (defense * 1.5)
	else: 
		d -= defense
	if d <= 0:
		d = 1
	if Global.Buff_4_1_K == true and health <= 10:
		health -= 1
	else:
		health -= d
	if Global.Buff_4_2_K == true:
		if d == 1:
			defense += 2
	if health <= 0:
		Global.health -= 1
		Global.player = null
		queue_free()

func heal(h):
	health += h

func abuff(a):
	damage += a

func dbuff(d):
	defense += d


func die():
	Global.player = null
	queue_free()


func _on_AttackArea_body_entered(body):
	if body.has_method("hp"):
		body.hp(damage)


func _on_AttackArea2_body_entered(body):
	if body.has_method("hp"):
		body.hp(damage)
		



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
