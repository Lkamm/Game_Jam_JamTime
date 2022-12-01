extends Node2D

var cannon = load("res://Weapons/MeatCannon.tscn")
var trap = load("res://Weapons/PastaTrap.tscn")
var Player = get_node_or_null("/root/Game/Player_Container/Player")
func _on_Cannon_mouse_entered():
	if Input.is_action_pressed("interact") and "Sauce" in Global.Ingredients:
		var cannons = cannon.instance()
		cannons.global.position = Vector2(750, 300)
		$Cannon.show()
		$CollisionShape2D.show()


func _on_Trap_mouse_entered():
	if Input.is_action_just_pressed("interact") and "Pasta" in Global.Ingredients:
		var Trap = trap.instance()
	pass # Replace with function body.


func _on_Trap2_mouse_entered():
	pass # Replace with function body.
