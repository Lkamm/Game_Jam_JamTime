extends StaticBody2D

var Meatball = load("res://Weapons/MeatCannonBall")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _shoot():
	var Weapon_Container = get_node_or_null("/root/Game/Weapon_Container")
	if Weapon_Container != null:
		var meatball = Meatball.instance()
		meatball.position = position + Vector2(45,0)
		Weapon_Container.add_child(meatball)
	

func _on_Timer_timeout():
	_shoot()
	
