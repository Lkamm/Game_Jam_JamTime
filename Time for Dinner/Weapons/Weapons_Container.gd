extends Node2D

var cannon = load("res://Weapons/MeatCannon.tscn")
var trap = load("res://Weapons/PastaTrap.tscn")
var Player = get_node_or_null("/root/Game/Player_Container/Player")
func _on_Cannon_mouse_entered():
	$Cannon/Label.show()
	if Input.is_action_pressed("attack") and "Sauce" in Global.Ingredients:
		var cannons = cannon.instance()
		$Cannon.show()
		$Cannon/CollisionShape2D.disabled = false



func _on_Trap_mouse_entered():
	$Pasta_Trap/Label.show()
	if Input.is_action_just_pressed("attack") and "Pasta" in Global.Ingredients:
		$Pasta_Trap/CollisionShape2D.disabled = false
		$Pasta_Trap.show()
		



func _on_Trap2_mouse_entered():
	$Pasta_Trap2/Label.show()
	if Input.is_action_just_pressed("attack") and "Pasta" in Global.Ingredients:
		var Trap = trap.instance()
		$Pasta_Trap2/CollisionShape2D.disabled = false
		$Pasta_Trap2.show()
		
