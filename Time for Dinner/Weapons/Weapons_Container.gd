extends Node2D

var cannon = load("res://Weapons/MeatCannon.tscn")
var trap = load("res://Weapons/PastaTrap.tscn")
var Player = get_node_or_null("/root/Game/Player_Container/Player")
func _on_Cannon_mouse_entered():
	$label.show()
	if Input.is_action_pressed("attack") and "Sauce" in Global.Ingredients:
		var cannons = cannon.instance()
		cannons.global.position = Vector2(750, 300)
		$Cannon.show()
		$CollisionShape2D.show()


func _on_Trap_mouse_entered():
	$Label.show()
	if Input.is_action_just_pressed("attack") and "Pasta" in Global.Ingredients:
		$Pasta_Trap/Pasta_Trap/Sprite.show()
		$Pasta_Trap/Pasta_Trap/CollisionShape2D.disabled = false



func _on_Trap2_mouse_entered():
	$Label.show()
	if Input.is_action_just_pressed("attack") and "Pasta" in Global.Ingredients:
		$Pasta_Trap2/Pasta_Trap/Sprite.show()
		$Pasta_Trap2/Pasta_Trap/CollisionShape2D.disabled = false 
		
