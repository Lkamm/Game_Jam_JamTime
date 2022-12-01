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
		$map.show()
		$Label.show()
		$Stown.show()
		$Cakeville.show()
		$Restaurant.show()
	

	

func _on_Restaurant_pressed():
	$map.hide()
	$Label.hide()
	$Button.hide()
	var scene = get_tree().change_scene("res://Game.tscn")


func _on_Stown_pressed():
	$map.hide()
	$Label.hide()
	$Button.hide()
	var scene = get_tree().change_scene("res://Areas/Stown.tscn")



func _on_Cakeville_pressed():
	$map.hide()
	$Label.hide()
	$Button.hide()
	var scene = get_tree().change_scene("res://Areas/Cakeville.tscn")
