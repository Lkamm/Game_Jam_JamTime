extends KinematicBody2D

onready var SM = $StateMachine

var health = 45
var defense = 5
var velocity = Vector2.ZERO
var jump_power = Vector2.ZERO
var direction = 1
var isAttacking = false
var damage = 15
var coin = 0
var recovermore = false
var statmore = false

export var gravity = Vector2(0,30)

export var move_speed = 25
export var max_move = 300

export var jump_speed = 180
export var max_jump = 800

export var leap_speed = 180
export var max_leap = 800

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
	
	if coin != Global.coin:
		if Global.Buff_1_1_A == true:
			defense += 1
		if Global.Buff_1_2_A == true:
			damage += 1
		if Global.Buff_2_1_A == true:
			recovermore = true
		if Global.Buff_2_2_A == true:
			statmore = true
		if Global.Buff_3_1_A == true:
			damage += (Global.items_collected / 6)
		if Global.Buff_3_2_A == true:
			health += 5
		else:
			health += 2
		if Global.Buff_4_1_A == true:
			move_speed += (Global.items_collected / 4)
		if Global.Buff_4_2_A == true:
			damage += (move_speed / 4)
		coin += 1
	

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
	d -= defense
	if d <= 0:
		d = 1
	health -= d
	if health <= 0:
		Global.health -= 1
		Global.player = null
		queue_free()

func heal(h):
	if recovermore == true:
		health += (h * 2)
	else: 
		health += h

func abuff(a):
	if statmore == true:
		damage += (a * 2)
	else:
		damage += a
	
func dbuff(d):
	if statmore == true:
		defense += (d * 2)
	else:
		defense += d

func die():
	Global.player = null
	queue_free()


func _on_AttackArea_body_entered(body):
	if body.has_method("hp"):
		body.hp(damage)


func _on_AttackAreaR_body_entered(body):
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
		
