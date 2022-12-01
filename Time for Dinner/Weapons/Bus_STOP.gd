extends StaticBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_mouse_entered():
		$Map_Container/map.show()
		$Map_Container/Restaurant.show()
		$Map_Container/Cakeville.show()
		$Map_Container/Stown.show()
		


func _on_Restaurant_pressed():
	print("restaurant")
	var _scene = get_tree().change_scene("res://Game.tscn")


func _on_Cakeville_pressed():
	var _scene = get_tree().change_scene("res://Areas/Cakeville.tscn")

func _on_Stown_pressed():
	var _scene = get_tree().change_scene("res://Areas/Stown.tscn")


func _on_Area2D_body_entered(body):
	if body.name == "Player":
		print("Showing")
		$Map_Container/map.show()
		$Map_Container/Restaurant.show()
		$Map_Container/Cakeville.show()
		$Map_Container/Stown.show()
	
